Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fJxH2FE9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Tlqp1zkm"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RkB1048nzDr10
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 16:56:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F1ED321C1B;
 Fri, 13 Jul 2018 02:56:37 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Fri, 13 Jul 2018 02:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=8HVcYImpj+y8yNdV1ftfDtg5hTRkQ
 DyykUnifnGA7xo=; b=fJxH2FE9m6qkxb8G4bc/o8AGoJ7EKY5cD0rIVx/4Eanu4
 0mvBnR5sgqdb55CHwVlIb8hCmvke600i+A9QPPy/PzqesrM/GbjTfEt6jtbs9M8i
 e6x73pG8uDG4F6CkYjCeHlNmrbS3xna47PqEaHFkDD/2P6yCrmNtBS+aHzR3GFXr
 1mYDe+B5lXV4EjcXYNLE6TYHyB6hpOAkGDxGmbFQd0Yms8nDjCv0RacGSzz6FcVg
 NSx3NQx68bgU3cLpn2IQNlC/Kaa8S95NK48Wb5Z3jSP/975/z3IFX2DyGOOBaeRc
 gmvCc8ZImwy4vJ1n0nUkxuGMl7w4d/Mi5HZj8zLbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8HVcYI
 mpj+y8yNdV1ftfDtg5hTRkQDyykUnifnGA7xo=; b=Tlqp1zkm8TzNIKujAl8YWw
 JoZao3EBPqyT1E8SKRYyOGCRPt0R0j+BlXCto9/aIwK9PQEugFTPe7ZcGltHs/o4
 EL48WBjRaQIpZHYvVHwzxUwiih7OkYLLeWlvEXAHyPjGhLfAA6EQOlgvdDoW2jLa
 Z6aaOneU3YzqKyINnvaObSW+SA+ZGe1jb2Lknf7Unk6d6959FauJoPMcPXujF5gV
 pcXn2MmziDBOv7ZMo3rO+1Eh10TIQhYoFzRPn3usXlSsrFvS7uZns5K08Lw1EgbR
 whuh+OZq+BG4JMI358RrcIOGqprlaDnz9Run33kLOQMHfDIIkpyPpxnfZFGQv8sw
 ==
X-ME-Proxy: <xmx:JU1IW4L8RUubLYGkjPbgcarM0ZSUiNo_-NlmI3PmN9VYO9pa0UoepA>
 <xmx:JU1IW0EOxroGZxieVNIsehf8cXNkbDHNht9hD38hYdZlnCNjqNjLHQ>
 <xmx:JU1IW-0T8Lt7w9rmaNL68U3bTctvQuSDRGFvKNaavphIuhzS6R_oKA>
 <xmx:JU1IW7xCQb6KtMKyKnxWroTUTNl6D3MGLNLekl98QmR1eWgAeC9aRA>
 <xmx:JU1IW9gEzj2CWVWTcffgitdbbufc4bJ90NJEV5TjMxq5B4yAv2qhIg>
 <xmx:JU1IWz0WwP2Y6lucU4ZmfN9WmKnyMCLg8WLFwjYwtudZc0ZrGFCUBg>
X-ME-Sender: <xms:JU1IW7Htu54tSQOQC_s72z-FhFuV4rwdtXWbDjD-T_0wu47FiOOA6w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4AA4DBA50C; Fri, 13 Jul 2018 02:56:37 -0400 (EDT)
Message-Id: <1531464997.759540.1439362504.21B25D92@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
Date: Fri, 13 Jul 2018 16:26:37 +0930
Subject: Re: How to handle security vulnerabilities (was: OpenBMC security
 workgroup status)
References: <OFE1ABED0B.13DF2F69-ON002582C8.007A50D4-002582C8.007AA270@notes.na.collabserv.com>
In-Reply-To: <OFE1ABED0B.13DF2F69-ON002582C8.007A50D4-002582C8.007AA270@notes.na.collabserv.com>
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
X-List-Received-Date: Fri, 13 Jul 2018 06:56:41 -0000

On Fri, 13 Jul 2018, at 07:49, Joseph Reynolds wrote:
> > What's the short-term strategy for handling [security] vulnerability
> > reports received in the gap between now and getting some formal
> > process in place?=20
> We don't have a strategy.  Let's discuss it here.
>=20=20
> Officially (https://github.com/openbmc/openbmc/ section "Bug Reporting")
> issues are managed on GitHub.=20
>
> Unofficially, Brad volunteered to accept one batch of security
> vulnerability reports and distribute them, presumably to the OpenBMC TSC
> members (https://github.com/openbmc/docs section "Technical Steering
> Committee ") or their delegates.  I assume they would privately contact
> a trusted OpenBMC contributor who could address the problem.=20
>
> We could adapt the Linux model
> (https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html),
> although I am still looking for information on what the Linux security
> team does with the bug report.  For example, how security group members
> track and discuss problems among themselves, how they pull in additional
> resources to fix or mitigate the problem, and how they inform downstream
> distros before announcing the problem, etc.=20

I thought the documention described most of this? security@kernel.org is a =
private list, so discussions can happen there freely. With respect to infor=
ming downstream distros, as mentioned that's done via the linux-distros@vs.=
openwall.org list. As for how they pull in additional resources to fix or m=
itigate the problem, that's going to depend on the affected parties. No-one=
 can order anyone to fix a particular problem, but the developers/maintaine=
rs/vendors involved have skin in the game so should be motivated to fix the=
 issue.

>
> I think the first step for the OpenBMC team is to establish an email
> address (like security@openbmc.org), subscribe only trusted people to
> that email list, and update the docs to explain that you should email
> the security team for security questions, and use issues for everything
> else.=20

Sounds good to me. Who can sort out security@? Brad? I'm sure we could sort=
 out list hosting on ozlabs.org if necessary (like we use for this list).

> Presumably, the security team would communicate privately among
> themselves and the submitter to assess the situation, and contact
> OpenBMC community members privately to address the problem.=20
> This would be an easy step to take, and would move the team in the right
> direction.=C2=A0 What do you think?

Sounds good enough for the moment!

Andrew
