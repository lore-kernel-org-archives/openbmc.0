Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ELENzZLN"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qTgm6pFnzDqHk
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 03:43:00 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id m1so51853pgq.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=L3nu9eYJajq1sHSIhUhrNrZP/2v6X7pL8ZZxOT7sSY0=;
 b=ELENzZLNdVkGVupDxELr4/xhuRvDQony0iUxH/GfjN12JXaDTsrPqDrOQE2NZiY7F3
 gxD3fo40vcFdcrXUZA9+ti+aaFqbghMSfPwuJNjHl/brV74BzA0Uavw9OCcyFbi4N8QB
 eRYlKoUrEYHQ4gl49J6lrCfd9ADxeHX/+LJV6A/Q7+AkAUtG1GefS6dhLCit5gj15YLz
 73JHyZnUjsMGE37GHiGMQvxaUazLOmmnqdJE8QxwkOEl1mg5j2wMdbH6Iy4D1muRZbg1
 0ZnIOP2ggjgZKfqcRZb7UJ2y0Ih+cdfj2GbV4Opoqbvg0UOCpxC3Tl5zA2e1hMn+9Mh2
 K12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=L3nu9eYJajq1sHSIhUhrNrZP/2v6X7pL8ZZxOT7sSY0=;
 b=FXlH4ClBulwNGUhuk7U8wpXy4NJtZXf5P5oNu2YxRCHRt6Io01gaViKcnrLYP23x4k
 Evgm/motcSeLfeMgMpI/mIOpDC15cgIEpehGhdrMvS+nv80aNfPj3Hp6n/Dzjl6Jfx10
 J/tSvN5pBL01zgItmmW5WfnXNmbSdMVmso0f0XrRfeNnf7GOf2B30QMvc7Kzuij3hLUZ
 lDrI+iD67vyLtwMp5WaNTHZPyf6nQ/788FxoDZTrBFsssC4+nyP4OGvykmzNTUVrHESM
 HlBTRYYWe2/lvJU/VHZutkfanfzlJafLWvYptEYOF80VrN6oB800uoJGuSr9+/OSN+CU
 rsow==
X-Gm-Message-State: AJcUukdV0HnjG0PNndgUqzQdVEK0bGWkuB6T9ltl/Evg8xHDcYFRbCXc
 ZIywTaQ+R6mvCkhMANgub016wabp+ZHXwAIglvUGT1x2
X-Google-Smtp-Source: ALg8bN4lveuEJN7FGjktoMDFolEORQnMXIZ+3tAckPxR3KgTh2rmBSFfn4lAYDnYnFleTPuVoDq+fUE/79mCpO/bA04=
X-Received: by 2002:a62:26c7:: with SMTP id m190mr31770742pfm.79.1548866578239; 
 Wed, 30 Jan 2019 08:42:58 -0800 (PST)
MIME-Version: 1.0
References: <CANT4NrJLCLwH6dW9iTD8yMUjdbw-7-ai6YEfw97s0D-sr33Vww@mail.gmail.com>
 <53839b56-77b1-e743-2737-46d77220780a@linux.vnet.ibm.com>
In-Reply-To: <53839b56-77b1-e743-2737-46d77220780a@linux.vnet.ibm.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Wed, 30 Jan 2019 10:42:47 -0600
Message-ID: <CANT4NrKHEWR2xa=L1meCWoV8d7_igKVr6QP5v2mbtm2b9gx2ww@mail.gmail.com>
Subject: Re: SNMP query
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 30 Jan 2019 16:43:02 -0000

My team has decided to forgo the Test button on the SNMP panel.  We
plan to offer the same field validation affordances for the query, but
now the user will be notified after the Save Settings button is
clicked. And we will provide an affordance if the user has to wait
more than a few seconds for the response.

Thank you all for the feedback.

-- Susan


On Tue, Jan 29, 2019 at 12:53 PM Ratan Gupta
<ratagupt@linux.vnet.ibm.com> wrote:
>
> Hi Susan,
>
> On 29/01/19 11:01 PM, susan jasinski wrote:
>
> On the GUI SNMP panel, all customers that we tested told us that they wan=
t the ability to test the manager host name or IP address that they provide=
 to be sure that it is accurate. Right now, the BMC does not have this abil=
ity.
>
> I wanted to get more info on this, Currently SNMP D-Bus service on the BM=
C does the validation for whether the IP is reachable or not as part of con=
figuration.
>
> Suppose if admin configures the hostname/ip which is valid end point(ping=
able hostname/ip) but not the SNMP trapdaemon, In this scenario what is cus=
tomer expectation?
>
> SNMP trapdaemon works on UDP, and the trapdaemon(162) listens only the tr=
ap messages not the SNMP agent messages.
>
> BMC uses the SNMP for sending the trap messages to the SNMP trapdaemon.
>
> Below link seems useful if BMC would have been SNMP client(sending messag=
es to port 161) and SNMP agent is sitting outside the BMC and on BMC I run =
the command SNMPwalk to find that the configured IP address is SNMP agent o=
r not which is not the case here.
>
>
> My team did some digging around on the internet and found this SNMP query=
 suggestion. https://support.panorama9.com/hc/en-us/articles/203568188-Test=
-if-SNMP-devices-are-responding-correctly-to-SNMP-queries
>
>
> I am looking for feedback on whether we should implement something simila=
r?
> - If we get a response from an SNMP enabled device in the backend, then w=
e would provide a  validation message like "Device responded to the SNMP qu=
ery"
>
> - If we do not get a response, then we would provide a validation message=
 like "Invalid host name or IP address, or the device did not respond to th=
e SNMP query"
>
> I am open to suggestions for the messages.
>
>
>
>
> -- Susan Jasinski
>
> Regards
>
> Ratan
