Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TRPz70ymzF36h
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 11:57:59 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 126E412773D;
 Sun, 15 Jul 2018 21:57:55 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: removed from GitHub openbmc/general-developers team
Message-Id: <DE6E1D76-4191-4A7D-B8FE-65C9205351B1@fuzziesquirrel.com>
Date: Sun, 15 Jul 2018 21:57:54 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
To: Dasari Sai <sdasari@fb.com>, nancy Yuen <yuenn@google.com>,
 "Tanous, Ed" <ed.tanous@intel.com>, alexander Amelkin <a.amelkin@yadro.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 01:58:00 -0000

I did some shuffling around in this GitHub team on Friday.  You might =
have
received a notification that you were removed from the team.  Rest =
assured
you were not removed but simply moved to a sub-team.

Your Jenkins instance at openpower.xyz performs continuous integration =
testing
of patches submitted to Gerrit from whitelisted patch submitters.  The
general-developers team (and sub-teams) is the whitelist.

I have been maintaining this whitelist - but starting now I'm delegating =
this
to those of you in the To: list.  I=E2=80=99ve created a number of =
sub-teams; one for
each entity that has signed one of the OpenBMC CLAs.  Feel free to =
re-delegate
to someone else in your organization if I didn=E2=80=99t get it right.

thx - brad=
