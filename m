Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EqkWlPOw"; 
 dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449LqT4Dw0zDqP2
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 05:36:37 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id d2so24650579qti.11
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9R+LO6Xae4EPi69xEFmEiE9ZmGEehL73M8AoSNwypOg=;
 b=EqkWlPOwMmDzfzLiPKpHptwtExrm+KtTNt04GH6k84lmZtqedNigDyaR7k/8dfYt9b
 7y7bNbeta/9ECRUoyINeZIeixsHWkruIVoqWoj6m0YJ9tOe9Kn+oMc4MJeR1+shIVWjQ
 9cBgtJmFb0uIbFqcIvA00+wdVZ0lSWpzyCs8bQkISyh1ihWih7bWwhTdDlH18a5A8Zbs
 jIwRMP4igPN/YnZjMO0KxhXQLxS1q+bYokoCYXB9J0Ul50EsBTkwhNiin3ogdl+uNIdl
 BqjOeFj9RThhtKrQAgY7/wBQoP8XdQfcm91oGZZXiYqeLyg6Yk1B3dr2TY2eaW7PpLnj
 3JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9R+LO6Xae4EPi69xEFmEiE9ZmGEehL73M8AoSNwypOg=;
 b=qTh4Jp3jYsXdLdwi62B8dfa3BpVfrtK3QbeZiifLSxyh0+LW69sr5/kZ96XNZsc5dV
 Ekwggoi/Qe1SiOfiazuR17OZpgPO0XPDxtHmBZTROdSmvs8kXa95YDTUnYZHgLiCu+m+
 rcWlnKEusGlfDbELbC4iuZCAX3W9RaEhrrWoLJ21fK21+XbNCL9oAnTVjEtFM7Jth4Ng
 f0viN7A7aPT0eVaFC0MD5j9nckV72S2/jb0N26OMuPJ2Z5rWaDC8n1TukX1aBhaLrwe0
 UNdQ1nx6gkLeIoWDevvGzgmz7uyBbdieXLh8aXBdtSUsUd1pLeV9yv3QlrWiw/iHKsP0
 P2hQ==
X-Gm-Message-State: APjAAAWQwCPhrSmp7j90EoyGCBu4gKQq+FNn7nOR+bjVSmMnFVibESjj
 rIoC4VGGBwQDUAW2eu5l4KhQTsDKxNE6AsRQZfHAgQ==
X-Google-Smtp-Source: APXvYqyhUITqLymwaiUAtF9UiVHN7TmLFdpb+JhKrUXboW2bA6bt8nWejOOh7p6BE+Cg0RWO6P0p1bWOxqEXiy0fS50=
X-Received: by 2002:ac8:30da:: with SMTP id w26mr601422qta.386.1551378992925; 
 Thu, 28 Feb 2019 10:36:32 -0800 (PST)
MIME-Version: 1.0
References: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
 <VI1PR08MB2799DE313D14D5C96966A840807E0@VI1PR08MB2799.eurprd08.prod.outlook.com>
 <9ef52020-8bd1-8aab-b8b4-56c636523892@linux.vnet.ibm.com>
In-Reply-To: <9ef52020-8bd1-8aab-b8b4-56c636523892@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 28 Feb 2019 10:36:21 -0800
Message-ID: <CAJoAoZ=KtCWabJUxxeUHnDdKz0fkKAFN6Cnvqpes3QETQJRuhA@mail.gmail.com>
Subject: Re: Proposal for pldmtool
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Alexander Amelkin <a.amelkin@yadro.com>, "benwei@fb.com" <benwei@fb.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Feb 2019 18:36:38 -0000

On Wed, Feb 27, 2019 at 10:29 PM Tom Joseph <tomjose@linux.vnet.ibm.com> wr=
ote:
>
>
>
> On Thursday 21 February 2019 11:12 PM, Supreeth Venkatesh wrote:
> > Tom,
> >
> > Thanks for sending this out as a feeler.
> > This sounds like a logical next step after implementation of PLDM and M=
CTP.
> > However, I have a couple of initial questions.
> >
> > " A provision to run pldmtool targeting OpenBMC over a custom network p=
ort and route the request to the PLDM daemon."
> > 1. Do you think it is ok to use this as external interface to BMC? I wa=
s under the impression that IPMI or Redfish were external facing interfaces=
 to BMC.
> >       PLDM was intended for inside the box communications.
> I agree that PLDM is intended for inside the box communications. The
> proposal is not to use it as an external interface, but rather give a
> provision to run pldmtool from outside the box.

I'm a little confused how this is different from external interface.
Could you elaborate? Are you trying to route through the host first?

> >
> > 2. Why not use Redfish device enablement for PLDM, so that the tool (ty=
pically http/s client) will issue PLDM requests in the form of Json payload=
.
> I think it is not guaranteed that the management controllers
> implementing pldm has https support.
> >
> > 3. Can you describe the use case for the tool to be run on host firmwar=
e? In my opinion, this is highly unlikely though it can be run from host us=
er space.
> This might not be a typical use-case to run pldmtool from host firmware.
> I was curious to know if someone will be interested to do this. But we
> do see a possibility of running it from Host OS targeting the BMC, just
> like ipmitool can be run from the host targeting the BMC via KCS/BT
> interfaces.
> >
> > Thanks,
> > Supreeth
> > -----Original Message-----
> > From: Tom Joseph <tomjose@linux.vnet.ibm.com>
> > Sent: Monday, February 18, 2019 4:09 AM
> > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Supreeth Venkatesh <Su=
preeth.Venkatesh@arm.com>; Alexander Amelkin <a.amelkin@yadro.com>; benwei@=
fb.com
> > Subject: Proposal for pldmtool
> >
> > Hi All,
> >
> > I wanted to put down initial thoughts on "pldmtool" which is a utility =
for controlling PLDM enabled devices. The naming of the utility was influen=
ced by ipmitool which is a client utility to control IPMI enabled devices. =
The pldmtool acts as the requester and sends the PLDM message to target any=
 PLDM enabled device. The PLDM response message is processed and expressed =
in human readable format.  This proposal needs to be considered on the basi=
s of the pldm design (https://github.com/openbmc/docs/blob/master/designs/p=
ldm-stack.md).
> > These are possible pldmtool usage scenarios.
> >
> > * pldmtool can run on OpenBMC and can target the PLDM daemon. PLDM daem=
on will have a D-Bus interface to accept PLDM requests.
> > * pldmtool can target other management controllers connected to BMC imp=
lementing PLDM stacks.
> > * A provision to run pldmtool targeting OpenBMC over a custom network p=
ort and route the request to the PLDM daemon.
> >
> > These are the some of the salient features in the pldmtool that
> >
> > * Provide user friendly command options
> > * Debug options to print detailed PLDM messages.
> > * Leverage libmctp and libpldm library getting developed for communicat=
ing with MCTP layer and for encoding/decoding PLDM messages.
> > (https://github.com/openbmc/pldm, https://github.com/jk-ozlabs/libmctp)
> >
> > The host firmware stacks typically have runtime constraints. If there i=
s interest in having pldmtool run on host firmware then pldmtool will have =
to be written in C. Apart from this consideration the natural choice will b=
e to develop this in modern C++.
> >
> > This mail is a feeler to seek the interests of the community. I will be=
 keen to follow-up this with a design template.
> >
> > Thanks,
> > Tom
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>


--=20
Emily Shaffer
