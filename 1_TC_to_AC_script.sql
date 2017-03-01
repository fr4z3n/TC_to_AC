CREATE TABLE `character_brew_of_the_month` (
  `guid` INT(10) UNSIGNED NOT NULL,
  `lastEventId` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `log_arena_fights` (
  `fight_id` INT(10) UNSIGNED NOT NULL,
  `time` DATETIME NOT NULL,
  `type` TINYINT(3) UNSIGNED NOT NULL,
  `duration` INT(10) UNSIGNED NOT NULL,
  `winner` INT(10) UNSIGNED NOT NULL,
  `loser` INT(10) UNSIGNED NOT NULL,
  `winner_tr` SMALLINT(5) UNSIGNED NOT NULL,
  `winner_mmr` SMALLINT(5) UNSIGNED NOT NULL,
  `winner_tr_change` SMALLINT(6) NOT NULL,
  `loser_tr` SMALLINT(5) UNSIGNED NOT NULL,
  `loser_mmr` SMALLINT(5) UNSIGNED NOT NULL,
  `loser_tr_change` SMALLINT(6) NOT NULL,
  `currOnline` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`fight_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

CREATE TABLE `log_arena_memberstats` (
  `fight_id` INT(10) UNSIGNED NOT NULL,
  `member_id` TINYINT(3) UNSIGNED NOT NULL,
  `name` CHAR(20) NOT NULL,
  `guid` INT(10) UNSIGNED NOT NULL,
  `team` INT(10) UNSIGNED NOT NULL,
  `account` INT(10) UNSIGNED NOT NULL,
  `ip` CHAR(15) NOT NULL,
  `damage` INT(10) UNSIGNED NOT NULL,
  `heal` INT(10) UNSIGNED NOT NULL,
  `kblows` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`fight_id`,`member_id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

CREATE TABLE `log_encounter` (
  `time` DATETIME NOT NULL,
  `map` SMALLINT(5) UNSIGNED NOT NULL,
  `difficulty` TINYINT(3) UNSIGNED NOT NULL,
  `creditType` TINYINT(3) UNSIGNED NOT NULL,
  `creditEntry` INT(10) UNSIGNED NOT NULL,
  `playersInfo` TEXT NOT NULL
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

CREATE TABLE `log_money` (
  `sender_acc` INT(11) UNSIGNED NOT NULL,
  `sender_guid` INT(11) UNSIGNED NOT NULL,
  `sender_name` CHAR(32) CHARACTER SET utf8 NOT NULL,
  `sender_ip` CHAR(32) CHARACTER SET utf8 NOT NULL,
  `receiver_acc` INT(11) UNSIGNED NOT NULL,
  `receiver_name` CHAR(32) CHARACTER SET utf8 NOT NULL,
  `money` BIGINT(20) UNSIGNED NOT NULL,
  `topic` CHAR(255) CHARACTER SET utf8 NOT NULL,
  `date` DATETIME NOT NULL
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

CREATE TABLE `gm_subsurveys` (
  `surveyId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subsurveyId` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` TEXT NOT NULL,
  PRIMARY KEY (`surveyId`,`subsurveyId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Player System';

CREATE TABLE `gm_surveys` (
  `surveyId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `mainSurvey` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `overallComment` LONGTEXT NOT NULL,
  `createTime` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxMMR` SMALLINT(5) NOT NULL,
  PRIMARY KEY (`surveyId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Player System';

CREATE TABLE `gm_tickets` (
  `ticketId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` VARCHAR(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` TEXT NOT NULL,
  `createTime` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `mapId` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `posX` FLOAT NOT NULL DEFAULT '0',
  `posY` FLOAT NOT NULL DEFAULT '0',
  `posZ` FLOAT NOT NULL DEFAULT '0',
  `lastModifiedTime` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `closedBy` INT(10) NOT NULL DEFAULT '0',
  `assignedTo` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` TEXT NOT NULL,
  `response` TEXT NOT NULL,
  `completed` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `escalated` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `viewed` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `haveTicket` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Player System';

CREATE TABLE `item_loot_storage` (
  `containerGUID` INT(10) UNSIGNED NOT NULL,
  `itemid` INT(10) UNSIGNED NOT NULL,
  `count` INT(10) UNSIGNED NOT NULL,
  `randomPropertyId` INT(10) NOT NULL,
  `randomSuffix` INT(10) UNSIGNED NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `character_entry_point` (
  `guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `joinX` FLOAT NOT NULL DEFAULT '0',
  `joinY` FLOAT NOT NULL DEFAULT '0',
  `joinZ` FLOAT NOT NULL DEFAULT '0',
  `joinO` FLOAT NOT NULL DEFAULT '0',
  `joinMapId` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiPath` TEXT,
  `mountSpell` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Player System';

CREATE TABLE `channels_bans` (
  `channelId` INT(10) UNSIGNED NOT NULL,
  `playerGUID` INT(10) UNSIGNED NOT NULL,
  `banTime` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`channelId`,`playerGUID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

--
-- Table structure for table `channels_rights`
--

DROP TABLE IF EXISTS `channels_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels_rights` (
  `name` VARCHAR(128) NOT NULL,
  `flags` INT(10) UNSIGNED NOT NULL,
  `speakdelay` INT(10) UNSIGNED NOT NULL,
  `joinmessage` VARCHAR(255) NOT NULL DEFAULT '',
  `delaymessage` VARCHAR(255) NOT NULL DEFAULT '',
  `moderators` TEXT,
  PRIMARY KEY (`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_rights`
--

LOCK TABLES `channels_rights` WRITE;
/*!40000 ALTER TABLE `channels_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels_rights` ENABLE KEYS */;
UNLOCK TABLES;


ALTER TABLE `character_spell_cooldown` ADD COLUMN `needSend` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `categoryEnd`;
ALTER TABLE `auctionhouse` CHANGE COLUMN `houseid` `auctioneerguid` INT(10) UNSIGNED NOT NULL DEFAULT '0' ;
ALTER TABLE `channels` 
ADD COLUMN `channelId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`channelId`);

TRUNCATE TABLE `character_talent`;

ALTER TABLE `character_talent` CHANGE COLUMN `talentGroup` `specMask` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`guid`, `spell`);

ALTER TABLE `characters` 
ADD COLUMN `playerBytes` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `money`,
ADD COLUMN `playerBytes2` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `playerBytes`;
UPDATE `characters` SET 
 playerBytes = (skin) | (face << 8) | (hairStyle << 16) | (hairColor << 24),
 playerBytes2 = (facialStyle) | (bankSlots << 16) | (restState << 24)
WHERE guid > 0;
ALTER TABLE `characters` DROP COLUMN `skin`;
ALTER TABLE `characters` DROP COLUMN `face`;
ALTER TABLE `characters` DROP COLUMN `hairStyle`;
ALTER TABLE `characters` DROP COLUMN `hairColor`;
ALTER TABLE `characters` DROP COLUMN `facialStyle`;
ALTER TABLE `characters` DROP COLUMN `bankSlots`;
ALTER TABLE `characters` DROP COLUMN `restState`;

ALTER TABLE `character_instance` CHANGE COLUMN `extendState` `extended` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0' ;

ALTER TABLE `character_arena_stats` 
ADD COLUMN `maxMMR` SMALLINT(5) NOT NULL AFTER `matchMakerRating`;

TRUNCATE TABLE `corpse`;
ALTER TABLE `corpse` 
ADD COLUMN `corpseGuid` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`corpseGuid`, `guid`);

ALTER TABLE `character_aura` 
ADD COLUMN `itemGuid` BIGINT(20) NOT NULL AFTER `casterGuid`;


ALTER TABLE character_spell DROP COLUMN `active`;
ALTER TABLE character_spell DROP COLUMN `disabled`;
ALTER TABLE character_spell ADD `specMask` TINYINT(3) UNSIGNED NOT NULL DEFAULT 255;


-- ALTER TABLE character_talent CHANGE `talentGroup` `specMask` tinyint(3) unsigned NOT NULL DEFAULT 0;

UPDATE characters SET talentGroupsCount=1 WHERE talentGroupsCount=0;

DELETE s FROM character_spell s JOIN __del_ability_spell t ON s.spell=t.spell; -- Remove all spells from spellability.dbc
DELETE s FROM character_spell s JOIN __del_override_spell t ON s.spell=t.spell; -- Remove all spells from overridespell.dbc
DELETE s FROM character_spell s JOIN __del_shapeshift_spell t ON s.spell=t.spell; -- Remove all spells from shapeshift.dbc
DELETE s FROM character_spell s JOIN __del_spell_learn_spell t ON s.spell=t.spell; -- Remove all spells from old spell_learn_spell table
DELETE s FROM character_spell s JOIN __del_talent_rest_ranks t ON s.spell=t.spell; -- Remove all talents which should not be in character_spell table
DELETE s FROM character_spell s JOIN __playercreateinfo_spell t ON s.spell=t.spell JOIN characters c ON s.guid = c.guid WHERE (t.racemask=0 OR (1<<(c.race-1))&t.racemask) AND (t.classmask=0 OR (1<<(c.class-1))&t.classmask); -- Remove all spells from playercreateinfo_spell
DELETE s FROM character_spell s JOIN __profession_autolearn t ON s.spell=t.spell; -- Remove all spells that are automatically learned from certain skill level
DELETE s FROM character_spell s JOIN characters c ON s.guid = c.guid WHERE s.spell = 674 AND c.class = 7; -- Remove Dual Wield From shamans
DELETE s FROM character_spell s JOIN __del_talent_pyroblast t1 ON s.spell=t1.spell LEFT JOIN __del_talent_pyroblast2 t2 ON t1.spell=t2.spell WHERE t2.spell IS NULL;

-- restore lower ranks not saved (dependant was not saved)
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=16);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=15);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=14);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=13);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=12);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=11);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=10);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=9);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=8);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=7);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=6);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=5);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=4);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=3);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=2);

UPDATE character_spell SET specMask=255; -- Set specMask of all spells to 255
UPDATE character_spell s JOIN __del_talent_pyroblast t ON s.spell=t.spell SET specMask=0; -- Set specMask to 0 for spells added to spellbook

-- Add missing profession spells
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=6);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=5);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=4);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=3);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=2);

-- Insert skill if missing (core would do this, but we need it for the queries below)
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=6);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=5);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=4);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=3);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=2);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=1);

-- Update max allowed skill based on spells
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=6 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=5 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=4 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=3 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=2 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=1 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
DELETE FROM character_skills WHERE MAX=0;
UPDATE character_skills SET VALUE=MAX WHERE VALUE>MAX;

-- Remove primary professions when having more than 2!
-- first delete skill
SET @cnt := 0;
SET @prevguid := 0;
DELETE s FROM character_skills s JOIN ((SELECT guid, skill FROM ((SELECT IF(@prevguid <> cs.guid, @cnt := 1, @cnt := @cnt+1) AS cnt, (@prevguid := guid) AS guid, cs.skill AS skill FROM character_skills cs JOIN __profession_skill t ON cs.skill = t.skill AND t.rank=6 ORDER BY cs.guid, cs.skill) X) WHERE cnt>2) x2) ON s.guid = x2.guid AND s.skill = x2.skill;
-- now delete main profession spells if skill is missing
DELETE s FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell LEFT JOIN character_skills cs ON s.guid = cs.guid AND t.skill = cs.skill WHERE cs.guid IS NULL;


-- PROFESSION SPECIALTY DATA!
-- TRUNCATE TABLE __profession_spell_req_spell;
-- Alchemy (rank 1 - 2259): 28672 (transmute), 28677 (elixir), 28675 (potion)
-- Blacksmithing (rank 1 - 2018): 9788 (armorsmith), 9787 (weaponsmith) -- Weaponsmith: 17040 (hammer), 17041 (axe), 17039 (sword)
-- Leatherworking (rank 1 - 2108): 10656 (dragon), 10658 (elemental), 10660 (tribal)
-- Tailoring (rank 1 - 3908): 26798 (mooncloth), 26801 (shadoweave), 26797 (spellfire)
-- Engineering (rank 1 - 4036): 20222 (goblin), 20219 (gnomish)
-- INSERT INTO __profession_spell_req_spell VALUES(28672, 2259), (28677, 2259), (28675, 2259);
-- INSERT INTO __profession_spell_req_spell VALUES(9788, 2018), (9787, 2018), (17040, 9787), (17041, 9787), (17039, 9787);
-- INSERT INTO __profession_spell_req_spell VALUES(10656, 2108), (10658, 2108), (10660, 2108);
-- INSERT INTO __profession_spell_req_spell VALUES(26798, 3908), (26801, 3908), (26797, 3908);
-- INSERT INTO __profession_spell_req_spell VALUES(20222, 4036), (20219, 4036);
-- THERE ARE ALSO SPECIALTY RECIPES IN THIS TABLE!
-- INSERT INTO __profession_spell_req_spell VALUES(36125, 9787), (36128, 9787), (36126, 9787); -- Weaponsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36122, 9788), (36129, 9788), (36130, 9788), (34533, 9788), (34529, 9788), (34534, 9788), (36257, 9788), (36256, 9788), (34530, 9788), (36124, 9788); -- Armorsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36262, 17040), (34546, 17040), (34545, 17040), (36136, 17040), (34547, 17040), (34567, 17040), (36263, 17040), (36137, 17040); -- Hammersmith
-- INSERT INTO __profession_spell_req_spell VALUES(36260, 17041), (34562, 17041), (34541, 17041), (36134, 17041), (36135, 17041), (36261, 17041), (34543, 17041), (34544, 17041); -- Axesmith
-- INSERT INTO __profession_spell_req_spell VALUES(36258, 17039), (34537, 17039), (34535, 17039), (36131, 17039), (36133, 17039), (34538, 17039), (34540, 17039), (36259, 17039); -- Swordsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36076, 10656), (36079, 10656), (35576, 10656), (35577, 10656), (35575, 10656), (35582, 10656), (35584, 10656), (35580, 10656); -- Dragon
-- INSERT INTO __profession_spell_req_spell VALUES(36074, 10658), (36077, 10658), (35590, 10658), (35591, 10658), (35589, 10658); -- Elemental
-- INSERT INTO __profession_spell_req_spell VALUES(35585, 10660), (35587, 10660), (35588, 10660), (36075, 10660), (36078, 10660); -- Tribal
-- INSERT INTO __profession_spell_req_spell VALUES(26752, 26797), (26753, 26797), (26754, 26797); -- Spellfire
-- INSERT INTO __profession_spell_req_spell VALUES(26760, 26798), (26761, 26798), (26762, 26798); -- Mooncloth
-- INSERT INTO __profession_spell_req_spell VALUES(26756, 26801), (26757, 26801), (26758, 26801); -- Shadoweave


-- Remove double specialties (always leaves last from the list above)
-- Alchemy
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28677 WHERE s.spell=28672;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28675 WHERE s.spell=28672;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28675 WHERE s.spell=28677;
-- Blacksmithing
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=9787 WHERE s.spell=9788;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17041 WHERE s.spell=17040;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17039 WHERE s.spell=17040;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17039 WHERE s.spell=17041;
-- Leatherworking
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10658 WHERE s.spell=10656;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10660 WHERE s.spell=10656;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10660 WHERE s.spell=10658;
-- Tailoring
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26801 WHERE s.spell=26798;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26797 WHERE s.spell=26798;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26797 WHERE s.spell=26801;
-- Engineering
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=20219 WHERE s.spell=20222;

-- Remove spells missing their required spell
-- Run 3 times: first - normal specialty is removed, second - recipes from specialty and specialty of specialty (blacksmithing only), third - recipes of specialty of specialty
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;

-- Remove spells missing their required skill (the same spells are removed when setting skill to 0)
DELETE s FROM character_spell s JOIN __profession_spell_req_skill t ON s.spell = t.spell LEFT JOIN character_skills cs ON s.guid = cs.guid AND t.reqskill = cs.skill WHERE cs.guid IS NULL;

-- GBoS fix
UPDATE character_spell s LEFT JOIN character_talent t ON s.guid = t.guid AND t.spell = 20911 SET s.specMask=0 WHERE s.spell = 25899 AND t.guid IS NULL;
UPDATE character_spell s JOIN character_talent t ON s.guid = t.guid AND t.spell = 20911 SET s.specMask=t.specMask WHERE s.spell = 25899;

-- add activation spells to all characters with dual spec
REPLACE INTO character_spell
SELECT guid,63645,255 FROM characters WHERE talentGroupsCount>1;

REPLACE INTO character_spell
SELECT guid,63644,255 FROM characters WHERE talentGroupsCount>1;
