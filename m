Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qkVD6kQbzDqSv
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 13:20:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 30 Jan 2019 21:21:06 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Jenkins CI authorization
Message-ID: <20190131022106.6jgg5rq3snfpsvxe@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2019 02:20:37 -0000

I'd like to migrate our "general-developers" group from Github to Gerrit.=
  You
can find the rationale below - I've filled out the design template and in=
cluded
it in this email.

I know, I know...it seems like a minor change to fill out the design temp=
late -
but at least the magic behind 'Ok to test' will be written down somewhere=
.

You can reply with comments, or just head over to
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/17795/ and leave fe=
edback
there.

thx - brad

---------------------------------------------------------------------
# Continuous integration and authorization for OpenBMC

Author:
  Brad Bishop !radsquirrel
Primary assignee:
  Brad Bishop !radsquirrel
Other contributors:
  None
Created:
  2019-01-30

## Problem Description
The OpenBMC project maintains a number of Jenkins CI jobs to ensure incom=
ing
contributions to the project source code meet a level of quality.  Incomi=
ng
contributions can be made by the general public - anyone with a Github ac=
count.
However unlikely, it is possible for a bad actor to make code submissions=
 that
attempt to compromise project resources, e.g. build systems, and as such =
some
amount of authorization of contributors must occur to provide some level =
of
protection from potential bad actors.


The project already has contributor authorization for CI.  This proposal =
serves
to describe the drawbacks of the current solution and propose an alternat=
ive
that addresses those drawbacks.

## Background and References
The current authorization solution checks the user for membership in the
openbmc/general-developers Github team.  If the contributor is a member o=
f the
team (or a general-developers sub-team), the automated CI processes are
triggered without any human intervention.  If the contributor is not a me=
mber of
the general-developers team, manual intervention (ok-to-test) is required=
 by a
project maintainer to trigger the automated CI processes.


Additonal reading:
https://en.wikipedia.org/wiki/Continuous_integration
https://jenkins.io/
https://help.github.com/articles/about-organizations/

## Requirements
The existing method for authorization has a singular problem - the Github
organization owner role.  In order for contributors to be added to the
openbmc/general-developers Github team, the contributor must first be a m=
ember
of the openbmc Github organization.  Only organziation owners can invite =
Github
users to become members of an organization.  Organization owners have
unrestricted access to all aspects of the project - it would be unwise to=
 bestow
organization ownership for the sole purpose of enabling
openbmc/general-developers group membership administrative capability.


An alternative authorization method for CI should:
 - Not require the Github organization owner role to administer the list =
of
   users authorized for CI.
 - Enable a hierarchical trust model for user authorization (groups neste=
d
   within groups).

## Proposed Design
The proposal is to simply migrate the current openbmc/general-developers =
Github
team, and all subordinate teams, to Gerrit groups:

group: xyzcorp
group: abccorp

The general-developers group can contain users that are not associated wi=
th any
specific organization, as well as organizational groups:

group: general-developers
contains:
    group xyzcorp, group abccorp, nancy, joe

This proposal also specifies a convention for administration of organizat=
ional
groups:

group: xyzcorp-admin administers -> xyzcorp
group: abccorp-admin administers -> abccorp
group: general-developers-admin administers -> general-developers

Finally, any Jenkins Ci jobs must be updated to test for membership of th=
e
Gerrit group instead of the Github team.

## Alternatives Considered
Assigning Github organization owner roles to organizational group adminis=
trators
was considered but is a major violation of the least-priviledge-required
principle.

## Impacts
Github has vastly superior load balancing and backup capability so there =
is a
potential for decreased service availability and data loss.

## Testing
Deploy on a live production server =F0=9F=98=80
