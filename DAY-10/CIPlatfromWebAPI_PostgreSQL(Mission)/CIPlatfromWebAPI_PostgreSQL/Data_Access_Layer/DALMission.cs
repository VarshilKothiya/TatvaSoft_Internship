﻿using Data_Access_Layer.Repository;
using Data_Access_Layer.Repository.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer
{
    public class DALMission
    {
        private readonly AppDbContext _cIDbContext;

        public DALMission(AppDbContext cIDbContext)
        {
            _cIDbContext = cIDbContext;
        }
        public List<Mission> MissionList()
        {
            return _cIDbContext.Mission.Where(x => !x.IsDeleted).ToList();
        }

        public async Task<Mission> GetMissionDetailByIdAsync(int id)
        {
            return await _cIDbContext.Mission.FindAsync(id);
        }

        public string AddMission(Mission mission)
        {
            string result = "";
            try
            {
                _cIDbContext.Mission.Add(mission);
                _cIDbContext.SaveChanges();
                result = "Mission added Successfully.";
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public async Task<string> UpdateMissionAsync(Mission mission)
        {
            var existingMission = await _cIDbContext.Mission.FindAsync(mission.Id);
            if (existingMission == null)
            {
                throw new Exception("Mission not found.");
            }

            existingMission.MissionTitle = mission.MissionTitle;
            existingMission.MissionDescription = mission.MissionDescription;
            existingMission.CountryId = mission.CountryId;
            existingMission.CityId = mission.CityId;
            existingMission.StartDate = mission.StartDate;
            existingMission.EndDate = mission.EndDate;
            existingMission.TotalSheets = mission.TotalSheets;
            existingMission.MissionThemeId = mission.MissionThemeId;
            existingMission.MissionSkillId = mission.MissionSkillId;
            existingMission.MissionImages = mission.MissionImages;
            // Update other properties as needed

            try
            {
                await _cIDbContext.SaveChangesAsync();
                return "Update Mission Successfully.";
            }
            catch (Exception ex)
            {
                throw new Exception("Error in updating mission.", ex);
            }
        }

        public async Task<string> DeleteMissionAsync(int id)
        {
            try
            {
                var existingMission = await _cIDbContext.Mission.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();
                if (existingMission != null)
                {
                    existingMission.IsDeleted = true;
                    await _cIDbContext.SaveChangesAsync();
                    return "Delete Mission Successfully.";
                }
                else
                {
                    throw new Exception("Mission is not found.");
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Error in deleting Mission.", ex);
            }
        }
        public List<Mission> ClientSideMissionList(int userId)
        {
            List<Mission> clientSideMissionList = new List<Mission>();
            try
            {
                clientSideMissionList = _cIDbContext.Mission
                    .Where(m => !m.IsDeleted)
                    .OrderBy(m => m.CreatedDate)
                    .Select(m => new Mission
                    {
                        Id = m.Id,
                        CountryId = m.CountryId,
                        CountryName = m.CountryName,
                        CityId = m.CityId,
                        CityName = m.CityName,
                        MissionTitle = m.MissionTitle,
                        MissionDescription = m.MissionDescription,
                        MissionOrganisationName = m.MissionOrganisationName,
                        MissionOrganisationDetail = m.MissionOrganisationDetail,
                        TotalSheets = m.TotalSheets,
                        RegistrationDeadLine = m.RegistrationDeadLine,
                        MissionThemeId = m.MissionThemeId,
                        MissionThemeName = m.MissionThemeName,
                        MissionImages = m.MissionImages,
                        MissionDocuments = m.MissionDocuments,
                        MissionSkillId = m.MissionSkillId,
                        MissionSkillName = string.Join(",", m.MissionSkillName),
                        MissionAvilability = m.MissionAvilability,
                        MissionVideoUrl = m.MissionVideoUrl,
                        MissionType = m.MissionType,
                        StartDate = m.StartDate,
                        EndDate = m.EndDate,
                        MissionStatus = m.RegistrationDeadLine < DateTime.Now.AddDays(-1) ? "Closed" : "Available",
                        MissionApplyStatus = _cIDbContext.MissionApplication.Any(ma => ma.MissionId == m.Id && ma.UserId == userId) ? "Applied" : "Apply",
                        MissionApproveStatus = _cIDbContext.MissionApplication.Any(ma => ma.MissionId == m.Id && ma.UserId == userId && ma.Status == true) ? "Approved" : "Applied",
                        MissionDateStatus = m.EndDate <= DateTime.Now.AddDays(-1) ? "MissionEnd" : "MissionRunning",
                        MissionDeadLineStatus = m.RegistrationDeadLine <= DateTime.Now.AddDays(-1) ? "Closed" : "Running",
                        MissionFavouriteStatus = _cIDbContext.MissionFavourites.Any(mf => mf.MissionId == m.Id && mf.UserId == userId) ? "1" : "0",
                        Rating = _cIDbContext.MissionRating.FirstOrDefault(mr => mr.MissionId == m.Id && mr.UserId == userId).Rating ?? 0
                    }).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
            return clientSideMissionList;
        }
    }
}

   
