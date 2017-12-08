Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bh0h04lA"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMF45n57zDrqP
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:02:00 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id j124so10731637lfg.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=x4mCp2eOaB4ynn140ZTKWTBXWqP/RW3sjCeHs74SKiY=;
 b=bh0h04lAF2p65Zn2n9QPiXWk7pSraV5Z4xRCQ8ty5j8geKF4v4oBBGUx9hlcVJlLKd
 esmSnqUjlDh/anK7l6FCXV22SW/RBBZyFlbBBGzkrkD83ATXIy1MHy5N2ZpsGu5tuaXf
 pT2CVJg8MkI7jYEK/r9uwo82axypTVXXwVX6EWkmuqtj2aGTTgsHQI6QxSuF7SPitc4z
 omqvXiesAjzapPfk2SrpP3BXuPe8GOFS3uKNWMeHw/Pyi5pr92tbQGcWl9noOkEyaFOD
 KLwVucgkOQIz5t/mhXAYTxuINl34Ia7fNwbpWx1d/af2FvuBKrDxJhHu8oR/KeUzastM
 4lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=x4mCp2eOaB4ynn140ZTKWTBXWqP/RW3sjCeHs74SKiY=;
 b=sBl+Mhd1Pty+kGCAf+3b7a5pxzq6QdirZhXeTPq5ARzFCLGiPQ4Vo+AHPSQoYcRy2N
 SNSgQD7NSB4e0J/EIVwq8bhydqDXJQF5wzuXiQUNDxvbixsCKv4fv/ZHgPubKaedeFJa
 iza5KMi/6fVcYqAw/MeaCxVjNISgA2y0apYqOyrYhIlwZ9TkQM/C0jSkjv9oX7RQO+dw
 4t6ruEyd2B7TC04+CKczFdi+/9fv8plHIAC5WNQMxjpw0+x99154C9dPwZZzBUrLGKBM
 NpQ8ZdV5DUBkBrvTasubJ7AeVZd9PbHmuRYZVsZ3uDJWr8OwpfdNk9hJCtpMD03SrlYR
 /4/w==
X-Gm-Message-State: AJaThX4sjUDB5k/hEI5jTsJFakMb0/+RPll4KdB09IuUDPcEIvkja7cc
 88fhKaOz40ixSrjPPKvciqSpKvQH/i7Pbiy5Htg=
X-Google-Smtp-Source: AGs4zMapgn3q4PjIo0rKsVj0JoeC/E+IAQmg96x7tw7pKZeZimQNQw/f05rGhmD5EvVg0WTfQGBXuz5wyT6Xh5xfrFM=
X-Received: by 10.46.56.8 with SMTP id f8mr16886446lja.46.1512712916891; Thu,
 07 Dec 2017 22:01:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:01:36 -0800 (PST)
In-Reply-To: <000401d36fe9$013e7590$03bb60b0$@linux.intel.com>
References: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
 <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
 <000401d36fe9$013e7590$03bb60b0$@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 16:31:36 +1030
X-Google-Sender-Auth: Cd8o2acGNd6mWDAy71YB93ASci4
Message-ID: <CACPK8Xd1c=T5WmSE+4MD=ndk5VS4ndtGJX_mB1o-mhnF8onMxw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC driver
To: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 06:02:01 -0000

On Fri, Dec 8, 2017 at 4:24 PM, Haiyue Wang <haiyue.wang@linux.intel.com> wrote:
> Great notes, will update a new patch later, thanks Joel.
>
> I implemented the kcs by referenced the upstream bt driver. And the upstream maintainer is as bellowing,
> I hope the openbmc expert to review my patch firstly, will send to the maintainer soon. :-)
>
> ./scripts/get_maintainer.pl drivers/char/ipmi/bt-bmc.c
> Corey Minyard <minyard@acm.org> (supporter:IPMI SUBSYSTEM)
> openipmi-developer@lists.sourceforge.net (moderated list:IPMI SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)

Yep, add to that list:

openbmc@lists.ozlabs.org
clg@fr.ibm.com
jk@ozlabs.org
andrew@aj.id.au
joel@jms.id.au

In the past we have spent a long time pre-reviewing on the openbmc
list, and then had another extensive review process on the upstream
list. I hope it will help us get the code in a mergeable state faster
by doing the work upstream, with the OpenBMC team providing input.

Cheers,

Joel
