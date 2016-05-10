Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3kpp1z4pzDq9s
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 13:13:21 +1000 (AEST)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 10 May 2016 13:13:20 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 May 2016 13:13:18 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 5C8E4357805B
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 13:13:18 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4A3DBUM1311118
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 13:13:18 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4A3CjKg008124
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 13:12:45 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4A3CjQ6006832; Tue, 10 May 2016 13:12:45 +1000
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6F1BBA01A5;
 Tue, 10 May 2016 13:11:52 +1000 (AEST)
Date: Tue, 10 May 2016 13:11:49 +1000
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v8 00/22] Add fan control algorithm
Message-ID: <20160510031149.GA10410@localhost.localdomain>
References: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051003-0005-0000-0000-000007B31194
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 03:13:22 -0000

Are these:
>   Revert "Fill in the threshold settings for CPU and DIMM"
>   Revert "Add I2C-6 lm75 outlet temperature sensor"
>   Revert "Setup FUNC_MODE[2:0]"

just reverts of these in the same series? Just don't include these
patches instead.
>   Fill in the threshold settings for CPU and DIMM
	(duplicated?)
>   Fill in the threshold settings for CPU and DIMM
>   Add I2C-6 lm75 outlet temperature sensor
>   Setup FUNC_MODE[2:0]

It also looks like
>   Revert "Setup FUNC_MODE[2:0]"
isn't actually a real revert of
>   Setup FUNC_MODE[2:0]
as it touches a bunch more stuff, was this done manually?

On Mon, May 09, 2016 at 09:10:28PM -0500, OpenBMC Patches wrote:
> 
> 
> <!-- Reviewable:start -->
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/59)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/skeleton/pull/59
> 
> Ken (8):
>   add i2craw tool and hdd status function
>   Heartbeat Led function
>   fix info memory leak
>   Setup FUNC_MODE[2:0]
>   fix info memory leak
>   Revert "Fill in the threshold settings for CPU and DIMM"
>   Add fan control algorithm
>   Fix skeleton Makefile
> 
> Ken Lai (3):
>   Revert "Add I2C-6 lm75 outlet temperature sensor"
>   Revert "Setup FUNC_MODE[2:0]"
>   Fix Makefile issue
> 
> johnhcwang (11):
>   Fill in the threshold settings for CPU and DIMM
>   Fill in the threshold settings for CPU and DIMM
>   Add I2C-6 lm75 outlet temperature sensor
>   Modify the hard-coded hwmon ID for PowerCap
>   Fill in the threshold settings for CPU and DIMM
>   Set lower threshold for ambient/CPU/DIMM sensors
>   Fix memory leak
>   Support FAN tach sensors
>   Generate thermaltrip event
>   Keep original design to generate thermaltrip event
>   Support FAN LED feature
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
