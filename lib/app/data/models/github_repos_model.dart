import 'package:hive/hive.dart';

part 'github_repos_model.g.dart';

class GithubRepos {
  GithubRepos({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  GithubRepos.fromJson(dynamic json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  num? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_count'] = totalCount;
    map['incomplete_results'] = incompleteResults;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

@HiveType(typeId: 2)
class Items {
  Items({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  Items.fromJson(dynamic json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    teamsUrl = json['teams_url'];
    hooksUrl = json['hooks_url'];
    issueEventsUrl = json['issue_events_url'];
    eventsUrl = json['events_url'];
    assigneesUrl = json['assignees_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitRefsUrl = json['git_refs_url'];
    treesUrl = json['trees_url'];
    statusesUrl = json['statuses_url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    commitsUrl = json['commits_url'];
    gitCommitsUrl = json['git_commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    contentsUrl = json['contents_url'];
    compareUrl = json['compare_url'];
    mergesUrl = json['merges_url'];
    archiveUrl = json['archive_url'];
    downloadsUrl = json['downloads_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    deploymentsUrl = json['deployments_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
    sshUrl = json['ssh_url'];
    cloneUrl = json['clone_url'];
    svnUrl = json['svn_url'];
    homepage = json['homepage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count'];
    mirrorUrl = json['mirror_url'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    license =
        json['license'] != null ? License.fromJson(json['license']) : null;
    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
    webCommitSignoffRequired = json['web_commit_signoff_required'];
    topics = json['topics'] != null ? json['topics'].cast<String>() : [];
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
    score = json['score'];
  }
  @HiveField(0)
  num? id;
  @HiveField(1)
  String? nodeId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? fullName;
  @HiveField(4)
  bool? private;
  @HiveField(5)
  Owner? owner;
  @HiveField(6)
  String? htmlUrl;
  @HiveField(7)
  String? description;
  @HiveField(8)
  bool? fork;
  @HiveField(9)
  String? url;
  @HiveField(10)
  String? forksUrl;
  @HiveField(11)
  String? keysUrl;
  @HiveField(12)
  String? collaboratorsUrl;
  @HiveField(13)
  String? teamsUrl;
  @HiveField(14)
  String? hooksUrl;
  @HiveField(15)
  String? issueEventsUrl;
  @HiveField(16)
  String? eventsUrl;
  @HiveField(17)
  String? assigneesUrl;
  @HiveField(18)
  String? branchesUrl;
  @HiveField(19)
  String? tagsUrl;
  @HiveField(20)
  String? blobsUrl;
  @HiveField(21)
  String? gitTagsUrl;
  @HiveField(22)
  String? gitRefsUrl;
  @HiveField(23)
  String? treesUrl;
  @HiveField(24)
  String? statusesUrl;
  @HiveField(25)
  String? languagesUrl;
  @HiveField(26)
  String? stargazersUrl;
  @HiveField(27)
  String? contributorsUrl;
  @HiveField(28)
  String? subscribersUrl;
  @HiveField(29)
  String? subscriptionUrl;
  String? commitsUrl;
  @HiveField(30)
  String? gitCommitsUrl;
  @HiveField(31)
  String? commentsUrl;
  @HiveField(32)
  String? issueCommentUrl;
  @HiveField(33)
  String? contentsUrl;
  @HiveField(34)
  String? compareUrl;
  @HiveField(35)
  String? mergesUrl;
  @HiveField(36)
  String? archiveUrl;
  @HiveField(37)
  String? downloadsUrl;
  @HiveField(38)
  String? issuesUrl;
  @HiveField(39)
  String? pullsUrl;
  @HiveField(40)
  String? milestonesUrl;
  @HiveField(41)
  String? notificationsUrl;
  @HiveField(42)
  String? labelsUrl;
  @HiveField(43)
  String? releasesUrl;
  @HiveField(45)
  String? deploymentsUrl;
  @HiveField(46)
  String? createdAt;
  @HiveField(47)
  String? updatedAt;
  @HiveField(48)
  String? pushedAt;
  @HiveField(49)
  String? gitUrl;
  @HiveField(50)
  String? sshUrl;
  @HiveField(51)
  String? cloneUrl;
  @HiveField(52)
  String? svnUrl;
  @HiveField(53)
  String? homepage;
  @HiveField(54)
  num? size;
  @HiveField(55)
  num? stargazersCount;
  @HiveField(56)
  num? watchersCount;
  @HiveField(57)
  String? language;
  @HiveField(58)
  bool? hasIssues;
  @HiveField(59)
  bool? hasProjects;
  @HiveField(60)
  bool? hasDownloads;
  @HiveField(61)
  bool? hasWiki;
  @HiveField(62)
  bool? hasPages;
  @HiveField(63)
  num? forksCount;
  @HiveField(64)
  dynamic mirrorUrl;
  @HiveField(65)
  bool? archived;
  @HiveField(66)
  bool? disabled;
  @HiveField(67)
  num? openIssuesCount;
  @HiveField(68)
  License? license;
  @HiveField(69)
  bool? allowForking;
  @HiveField(70)
  bool? isTemplate;
  @HiveField(71)
  bool? webCommitSignoffRequired;
  @HiveField(72)
  List<String>? topics;
  @HiveField(73)
  String? visibility;
  @HiveField(74)
  num? forks;
  @HiveField(75)
  num? openIssues;
  @HiveField(76)
  num? watchers;
  @HiveField(77)
  String? defaultBranch;
  @HiveField(78)
  num? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['node_id'] = nodeId;
    map['name'] = name;
    map['full_name'] = fullName;
    map['private'] = private;
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['html_url'] = htmlUrl;
    map['description'] = description;
    map['fork'] = fork;
    map['url'] = url;
    map['forks_url'] = forksUrl;
    map['keys_url'] = keysUrl;
    map['collaborators_url'] = collaboratorsUrl;
    map['teams_url'] = teamsUrl;
    map['hooks_url'] = hooksUrl;
    map['issue_events_url'] = issueEventsUrl;
    map['events_url'] = eventsUrl;
    map['assignees_url'] = assigneesUrl;
    map['branches_url'] = branchesUrl;
    map['tags_url'] = tagsUrl;
    map['blobs_url'] = blobsUrl;
    map['git_tags_url'] = gitTagsUrl;
    map['git_refs_url'] = gitRefsUrl;
    map['trees_url'] = treesUrl;
    map['statuses_url'] = statusesUrl;
    map['languages_url'] = languagesUrl;
    map['stargazers_url'] = stargazersUrl;
    map['contributors_url'] = contributorsUrl;
    map['subscribers_url'] = subscribersUrl;
    map['subscription_url'] = subscriptionUrl;
    map['commits_url'] = commitsUrl;
    map['git_commits_url'] = gitCommitsUrl;
    map['comments_url'] = commentsUrl;
    map['issue_comment_url'] = issueCommentUrl;
    map['contents_url'] = contentsUrl;
    map['compare_url'] = compareUrl;
    map['merges_url'] = mergesUrl;
    map['archive_url'] = archiveUrl;
    map['downloads_url'] = downloadsUrl;
    map['issues_url'] = issuesUrl;
    map['pulls_url'] = pullsUrl;
    map['milestones_url'] = milestonesUrl;
    map['notifications_url'] = notificationsUrl;
    map['labels_url'] = labelsUrl;
    map['releases_url'] = releasesUrl;
    map['deployments_url'] = deploymentsUrl;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['pushed_at'] = pushedAt;
    map['git_url'] = gitUrl;
    map['ssh_url'] = sshUrl;
    map['clone_url'] = cloneUrl;
    map['svn_url'] = svnUrl;
    map['homepage'] = homepage;
    map['size'] = size;
    map['stargazers_count'] = stargazersCount;
    map['watchers_count'] = watchersCount;
    map['language'] = language;
    map['has_issues'] = hasIssues;
    map['has_projects'] = hasProjects;
    map['has_downloads'] = hasDownloads;
    map['has_wiki'] = hasWiki;
    map['has_pages'] = hasPages;
    map['forks_count'] = forksCount;
    map['mirror_url'] = mirrorUrl;
    map['archived'] = archived;
    map['disabled'] = disabled;
    map['open_issues_count'] = openIssuesCount;
    if (license != null) {
      map['license'] = license?.toJson();
    }
    map['allow_forking'] = allowForking;
    map['is_template'] = isTemplate;
    map['web_commit_signoff_required'] = webCommitSignoffRequired;
    map['topics'] = topics;
    map['visibility'] = visibility;
    map['forks'] = forks;
    map['open_issues'] = openIssues;
    map['watchers'] = watchers;
    map['default_branch'] = defaultBranch;
    map['score'] = score;
    return map;
  }
}

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  License.fromJson(dynamic json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
  }
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['name'] = name;
    map['spdx_id'] = spdxId;
    map['url'] = url;
    map['node_id'] = nodeId;
    return map;
  }
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  Owner.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }
  String? login;
  num? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['avatar_url'] = avatarUrl;
    map['gravatar_id'] = gravatarId;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['followers_url'] = followersUrl;
    map['following_url'] = followingUrl;
    map['gists_url'] = gistsUrl;
    map['starred_url'] = starredUrl;
    map['subscriptions_url'] = subscriptionsUrl;
    map['organizations_url'] = organizationsUrl;
    map['repos_url'] = reposUrl;
    map['events_url'] = eventsUrl;
    map['received_events_url'] = receivedEventsUrl;
    map['type'] = type;
    map['site_admin'] = siteAdmin;
    return map;
  }
}
