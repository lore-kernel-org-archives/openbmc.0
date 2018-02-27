Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="P+6DEWh+"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zr4KF2Z22zF1LL
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 14:42:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519702977; x=1551238977;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OM1bHoKi/ovT6mA38Sk2yFBExxLTjoeilzZ7W2TVTKY=;
 b=P+6DEWh+CriFUrcbSP2AZncNGQCCs3f2ryW9UtEGK13C6KFlrAiLFkVp
 FzO9+ftoh/mumhGFEN9+tE8gJjal6ag69KMOATNYCnE5lX8D7a83ZDl2z
 0eU0gSErv4WeiLEaAF34vFYzjrt8gyjKCN09Jzp8wgBNb09EFi2YAs8Zd Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FjAABe05Rah2Oa6EReGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQlgQAojXaNf4ICgRaOH4dmghYKGIUbAoJFVBgBAgEBAQEBAQI?=
 =?us-ascii?q?BAhABAQEKCwkIKC+COCQBgkcBAQEDAQE5PxALEQMBAgEJExIPBRQnDhOFCAiuR?=
 =?us-ascii?q?oh1ghQBAQEBAQEBAQEBAQEBAQEBASGHQoZqgy4EhS2CNAWSOY8oCQqOK4VeghO?=
 =?us-ascii?q?FZop0lXWBLx6CCk0jgxKCU4ImWAEBjSgBAQE?=
X-IPAS-Result: =?us-ascii?q?A2FjAABe05Rah2Oa6EReGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?lgQAojXaNf4ICgRaOH4dmghYKGIUbAoJFVBgBAgEBAQEBAQIBAhABAQEKCwkIK?=
 =?us-ascii?q?C+COCQBgkcBAQEDAQE5PxALEQMBAgEJExIPBRQnDhOFCAiuRoh1ghQBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBASGHQoZqgy4EhS2CNAWSOY8oCQqOK4VeghOFZop0lXWBLx6CC?=
 =?us-ascii?q?k0jgxKCU4ImWAEBjSgBAQE?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 21:42:53 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 09:42:53 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; d="scan'208";a="623337831"
X-DLP: DLP_GlobalPCIDSS
Date: Mon, 26 Feb 2018 21:42:52 -0600
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>
Cc: Michael.E.Brown@dell.com, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Redfish Working Group - meeting times open discussion
Message-ID: <20180227034229.GA8216@wn7x64-4cggry1.aus.amer.dell.com>
References: <5213c491520645a3931dda63b4cac71c@ausx13mps334.AMER.DELL.COM>
 <OF08854A1A.1EE22BA0-ON65258241.000EAA0D-65258241.000F7172@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF08854A1A.1EE22BA0-ON65258241.000EAA0D-65258241.000F7172@notes.na.collabserv.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Tue, 27 Feb 2018 03:42:59 -0000

On Tue, Feb 27, 2018 at 08:18:40AM +0530, Hariharasubramanian Ramasubramanian wrote:
>    "openbmc" <openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org> wrote
>    on 02/27/2018 04:46:55 AM:
>    > From: <Michael.E.Brown@dell.com>
>    > To: <openbmc@lists.ozlabs.org>
>    > Date: 02/27/2018 06:32 AM
>    > Subject: OpenBMC Redfish Working Group - meeting times open
>    discussion
>    > Sent by: "openbmc"
>    <openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org>
>    >
>    > From the first working group meeting, one discussion item was the
>    > meeting time. We had decided last week to host the inaugural meeting
>    > at 4pm CST on Feb 26.
>    I didn't realize we _decided_ on this time.

This was the consensus in the meeting today. But I promised I would ask because I know there were voices I didn't hear.

Ed or I will send out a poll (I need to figure out how, I think Ed knows how already).


>    > We are intending to continue holding meetings
>    > on Monday at 4pm CST going forward.
>    Please don't. This time (3:30am IST) is _not_ convenient to me.

Secret message received! :)

>    >
>    > We had representation from Microsoft, Intel, Dell, and some IBM
>    > folks on the call today. It seems to work reasonably well at this
>    > time. Is there anybody that really must be part of this working
>    > group who cannot make this time work and needs us to change the
>    > meeting time?
>    Yes. I recall voting for 8am/9am CST.

We will make that one of the options.

--
Michael
