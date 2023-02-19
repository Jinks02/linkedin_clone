import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:linkedin_clone/utils/utils.dart';
import 'dart:developer';

class InviteFollowUserGithub {
  final String _githubAccessToken =
      "";
  final Utils _utils = Utils();

  Future<void> followGithubUser(String userName) async {
    final github = GitHub(
      auth: Authentication.withToken(_githubAccessToken),
    );
    await github.users.followUser(userName).then((value) {
      _utils.showToastMessage("Followed this user");
      log("followed $userName");
    }).onError((error, stackTrace) {
      log(error.toString());
      _utils.showToastMessage("Error Occurred in following");
    });
  }

  // Future<void> inviteGithubUser(String repoName) async {
  //
  //   final github = GitHub(
  //     auth: Authentication.withToken(_githubAccessToken),
  //   );
  //
  //   final issue = await github.issues.create(
  //     RepositorySlug("Jinks02", repoName),
  //     IssueRequest(
  //       title: "Invitation from Jinks02",
  //       body: "Please join this repository named $repoName"
  //     ),
  //   );
  //   log(issue.state);
  // }

  Future<void> inviteGithubUser(String repoName) async {

    final github = GitHub(
      auth: Authentication.withToken(_githubAccessToken),
    );

    final issue = await github.issues.create(
      RepositorySlug("Jinks02", repoName),
      IssueRequest(
          title: "Invitation from Jinks02",
          body: "Please join this repository named $repoName"
      ),
    );
    if(issue.state == 'open'){
      _utils.showToastMessage("invitation sent");
    }
    else{
      _utils.showToastMessage("failed to invite");
    }

    log(issue.state);
    log(issue.title);
    log(issue.body);
    log(issue.url);
    log(issue.user.toString());
    log(issue.assignee.toString());
  }

  Future<void> sendInviteRequest (String repoName,String assigneeName) async{
    final github = GitHub(auth: Authentication.withToken(_githubAccessToken));

    final RepositorySlug repositorySlug = RepositorySlug('Jinks02', repoName);
     String collaboratorName = assigneeName;

    final issuesService = IssuesService(github);
    final IssueRequest issueRequest = IssueRequest(title: 'Invitation to collaborate', body: 'Please accept this invitation to collaborate on this repository.');
    issueRequest.assignee = collaboratorName;
    // final Issue newIssue = await issuesService.createIssue(repositorySlug, issueRequest);
    final Issue issue = await issuesService.create(repositorySlug, issueRequest);

    log(issue.state);
    log(issue.title);
    log(issue.body);
    log(issue.url);
    log(issue.user.toString());
    log(issue.assignee.toString());

    if (issue != null) {
      // Issue successfully created
      _utils.showToastMessage("notification sent");
    } else {
      // Failed to create issue
      _utils.showToastMessage("failed to create issue");
    }
  }



}
