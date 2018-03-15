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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40291f0X0HzF1K6
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 00:49:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id EA3C16E207;
 Thu, 15 Mar 2018 09:49:21 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Increasing GitHub issues value
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9f0a5475-3c1b-d744-6708-16ec881e6dcb@yadro.com>
Date: Thu, 15 Mar 2018 09:49:21 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <90C9DBA4-5AC2-4DDF-A82E-20C85693EB59@fuzziesquirrel.com>
References: <9f0a5475-3c1b-d744-6708-16ec881e6dcb@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2018 13:49:27 -0000


> On Mar 15, 2018, at 6:08 AM, Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
>=20
> Hi everyone!
>=20
> While trying to write a customer-readable Change Log and Release =
Notes,
> I've been browsing through a lot of git commit logs, some of them
> referencing GitHub issues. I have noticed one common problem shared by
> almost all issues that makes it extremely painful to create the =
document
> I was trying to make. That is a total lack of reasoning behind the
> conducted changes. A typical issue looks like an imperative "Change
> everything" without even a slight hint as to "why do that" and "what =
was
> wrong with the original code".
>=20
> There are lots of such issues by almost all the members.
>=20
> My proposal is to enforce verbose desriptions in GitHub issues.
>=20
> =46rom my previous experience of working on DO-178B certified =
projects,
> the following approach helps a lot when doing a retrospective of the
> changes or investigating why a certain part of code is present and/or
> works as it does (was it intended, or is it a mistake):
>=20
> 1. As the initial description (first comment) for the issue, write as
> many words as you can to explain the original problem, trying as hard =
as
> possible to make this description clear to a non-member, a
> non-programmer (admin), or even a non-technical person. Be as much
> user-centric in the description as possible, but don't forget to =
include
> all the technical details that you have as well, for they will be =
needed
> for the engineer assigned to this issue or even yourself later when =
you
> come back to this issue 3 years later in search of a root cause for =
some
> problem.
>=20
> 2. When you get to working on the issue, write a verbose "Analysis"
> comment describing what you have discovered while investigating the
> original problem. Any quotes from e-mail correspondence, links to
> mailing list posts, etc. are very welcome in this part. Filling out =
this
> part often helps to realize that you've been actually going a wrong =
way
> or that the original problem is not a problem at all.
>=20
> 3. Once you come up with a solution, write a comment (verbose again)
> that describes what exactly you're going to do and why (although "why"
> should have mostly been covered in the "Analysis" part). This greatly
> helps in clearing your own mind and obtaining a precise understanding =
of
> your changes before you actually push them, helps reviewers to review
> the pushed code, and later helps to fix bugs in it that passed the =
review.
>=20
> 4. Preferably describe in a separate comment the impact on the end =
user
> experience that your change is going to have (i.e. what change in =
system
> behavior or UI does it yield). If all the issues (or better yet commit
> logs) had this part, writing Release Notes would be a breeze.
>=20
> What do you guys think?
>=20
> With best regards,
> Alexander.
>=20
>=20

I agree these are all behaviors that lead to real value.  I have been
mostly focused on improving our commit messages.

The method I use to do that is I review code, and ask for a better =
commit
message in the review and explain the value of doing so.  Over time =
people
see that and they themselves might start to write better commit messages
and ask for it in code they review.  In the end I hope this effect =
snowballs
and we are all asking for and writing good commit messages.

I wonder if a similar approach could work here?  How do you feel about =
driving
this change into our culture?  I don=E2=80=99t have any other ideas - in =
my experience
there has to be repetitive follow-through in order to make something =
like
this stick.

This is obviously a big task, and I wouldn=E2=80=99t expect you to do it =
alone.  If
no-one helps you, then that is a sign the community either doesn=E2=80=99t=
 agree with
the value it provides, or it does agree but feels the time is better =
spent
elsewhere.

Thoughts?

-brad=
