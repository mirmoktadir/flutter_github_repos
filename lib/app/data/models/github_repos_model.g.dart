// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 2;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items(
      id: fields[0] as num?,
      nodeId: fields[1] as String?,
      name: fields[2] as String?,
      fullName: fields[3] as String?,
      private: fields[4] as bool?,
      owner: fields[5] as Owner?,
      htmlUrl: fields[6] as String?,
      description: fields[7] as String?,
      fork: fields[8] as bool?,
      url: fields[9] as String?,
      forksUrl: fields[10] as String?,
      keysUrl: fields[11] as String?,
      collaboratorsUrl: fields[12] as String?,
      teamsUrl: fields[13] as String?,
      hooksUrl: fields[14] as String?,
      issueEventsUrl: fields[15] as String?,
      eventsUrl: fields[16] as String?,
      assigneesUrl: fields[17] as String?,
      branchesUrl: fields[18] as String?,
      tagsUrl: fields[19] as String?,
      blobsUrl: fields[20] as String?,
      gitTagsUrl: fields[21] as String?,
      gitRefsUrl: fields[22] as String?,
      treesUrl: fields[23] as String?,
      statusesUrl: fields[24] as String?,
      languagesUrl: fields[25] as String?,
      stargazersUrl: fields[26] as String?,
      contributorsUrl: fields[27] as String?,
      subscribersUrl: fields[28] as String?,
      subscriptionUrl: fields[29] as String?,
      gitCommitsUrl: fields[30] as String?,
      commentsUrl: fields[31] as String?,
      issueCommentUrl: fields[32] as String?,
      contentsUrl: fields[33] as String?,
      compareUrl: fields[34] as String?,
      mergesUrl: fields[35] as String?,
      archiveUrl: fields[36] as String?,
      downloadsUrl: fields[37] as String?,
      issuesUrl: fields[38] as String?,
      pullsUrl: fields[39] as String?,
      milestonesUrl: fields[40] as String?,
      notificationsUrl: fields[41] as String?,
      labelsUrl: fields[42] as String?,
      releasesUrl: fields[43] as String?,
      deploymentsUrl: fields[45] as String?,
      createdAt: fields[46] as String?,
      updatedAt: fields[47] as String?,
      pushedAt: fields[48] as String?,
      gitUrl: fields[49] as String?,
      sshUrl: fields[50] as String?,
      cloneUrl: fields[51] as String?,
      svnUrl: fields[52] as String?,
      homepage: fields[53] as String?,
      size: fields[54] as num?,
      stargazersCount: fields[55] as num?,
      watchersCount: fields[56] as num?,
      language: fields[57] as String?,
      hasIssues: fields[58] as bool?,
      hasProjects: fields[59] as bool?,
      hasDownloads: fields[60] as bool?,
      hasWiki: fields[61] as bool?,
      hasPages: fields[62] as bool?,
      forksCount: fields[63] as num?,
      mirrorUrl: fields[64] as dynamic,
      archived: fields[65] as bool?,
      disabled: fields[66] as bool?,
      openIssuesCount: fields[67] as num?,
      license: fields[68] as License?,
      allowForking: fields[69] as bool?,
      isTemplate: fields[70] as bool?,
      webCommitSignoffRequired: fields[71] as bool?,
      topics: (fields[72] as List?)?.cast<String>(),
      visibility: fields[73] as String?,
      forks: fields[74] as num?,
      openIssues: fields[75] as num?,
      watchers: fields[76] as num?,
      defaultBranch: fields[77] as String?,
      score: fields[78] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(78)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nodeId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.private)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.htmlUrl)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.fork)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.forksUrl)
      ..writeByte(11)
      ..write(obj.keysUrl)
      ..writeByte(12)
      ..write(obj.collaboratorsUrl)
      ..writeByte(13)
      ..write(obj.teamsUrl)
      ..writeByte(14)
      ..write(obj.hooksUrl)
      ..writeByte(15)
      ..write(obj.issueEventsUrl)
      ..writeByte(16)
      ..write(obj.eventsUrl)
      ..writeByte(17)
      ..write(obj.assigneesUrl)
      ..writeByte(18)
      ..write(obj.branchesUrl)
      ..writeByte(19)
      ..write(obj.tagsUrl)
      ..writeByte(20)
      ..write(obj.blobsUrl)
      ..writeByte(21)
      ..write(obj.gitTagsUrl)
      ..writeByte(22)
      ..write(obj.gitRefsUrl)
      ..writeByte(23)
      ..write(obj.treesUrl)
      ..writeByte(24)
      ..write(obj.statusesUrl)
      ..writeByte(25)
      ..write(obj.languagesUrl)
      ..writeByte(26)
      ..write(obj.stargazersUrl)
      ..writeByte(27)
      ..write(obj.contributorsUrl)
      ..writeByte(28)
      ..write(obj.subscribersUrl)
      ..writeByte(29)
      ..write(obj.subscriptionUrl)
      ..writeByte(30)
      ..write(obj.gitCommitsUrl)
      ..writeByte(31)
      ..write(obj.commentsUrl)
      ..writeByte(32)
      ..write(obj.issueCommentUrl)
      ..writeByte(33)
      ..write(obj.contentsUrl)
      ..writeByte(34)
      ..write(obj.compareUrl)
      ..writeByte(35)
      ..write(obj.mergesUrl)
      ..writeByte(36)
      ..write(obj.archiveUrl)
      ..writeByte(37)
      ..write(obj.downloadsUrl)
      ..writeByte(38)
      ..write(obj.issuesUrl)
      ..writeByte(39)
      ..write(obj.pullsUrl)
      ..writeByte(40)
      ..write(obj.milestonesUrl)
      ..writeByte(41)
      ..write(obj.notificationsUrl)
      ..writeByte(42)
      ..write(obj.labelsUrl)
      ..writeByte(43)
      ..write(obj.releasesUrl)
      ..writeByte(45)
      ..write(obj.deploymentsUrl)
      ..writeByte(46)
      ..write(obj.createdAt)
      ..writeByte(47)
      ..write(obj.updatedAt)
      ..writeByte(48)
      ..write(obj.pushedAt)
      ..writeByte(49)
      ..write(obj.gitUrl)
      ..writeByte(50)
      ..write(obj.sshUrl)
      ..writeByte(51)
      ..write(obj.cloneUrl)
      ..writeByte(52)
      ..write(obj.svnUrl)
      ..writeByte(53)
      ..write(obj.homepage)
      ..writeByte(54)
      ..write(obj.size)
      ..writeByte(55)
      ..write(obj.stargazersCount)
      ..writeByte(56)
      ..write(obj.watchersCount)
      ..writeByte(57)
      ..write(obj.language)
      ..writeByte(58)
      ..write(obj.hasIssues)
      ..writeByte(59)
      ..write(obj.hasProjects)
      ..writeByte(60)
      ..write(obj.hasDownloads)
      ..writeByte(61)
      ..write(obj.hasWiki)
      ..writeByte(62)
      ..write(obj.hasPages)
      ..writeByte(63)
      ..write(obj.forksCount)
      ..writeByte(64)
      ..write(obj.mirrorUrl)
      ..writeByte(65)
      ..write(obj.archived)
      ..writeByte(66)
      ..write(obj.disabled)
      ..writeByte(67)
      ..write(obj.openIssuesCount)
      ..writeByte(68)
      ..write(obj.license)
      ..writeByte(69)
      ..write(obj.allowForking)
      ..writeByte(70)
      ..write(obj.isTemplate)
      ..writeByte(71)
      ..write(obj.webCommitSignoffRequired)
      ..writeByte(72)
      ..write(obj.topics)
      ..writeByte(73)
      ..write(obj.visibility)
      ..writeByte(74)
      ..write(obj.forks)
      ..writeByte(75)
      ..write(obj.openIssues)
      ..writeByte(76)
      ..write(obj.watchers)
      ..writeByte(77)
      ..write(obj.defaultBranch)
      ..writeByte(78)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
