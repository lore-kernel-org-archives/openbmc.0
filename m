Return-Path: <sam.mj@au1.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2028D1A06BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:03:38 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 12 Jan 2016 12:03:36 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 12 Jan 2016 12:03:33 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 064A02CE805B
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:03:26 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C238sK15007858
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:03:16 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C22rP1021523
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:02:53 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C22rsU020726; Tue, 12 Jan 2016 13:02:53 +1100
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C92A2A0118;
 Tue, 12 Jan 2016 13:02:28 +1100 (AEDT)
Date: Tue, 12 Jan 2016 13:02:28 +1100
From: Sam Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v7] Add get/set boot option ipmid
 command support with correct DBUS property handling.
Message-ID: <20160112020228.GA19934@localhost.localdomain>
References: <1452559839-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452559839-27825-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1452559839-27825-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011202-0009-0000-0000-000002BDB154
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 02:03:38 -0000

Hi,

On Mon, Jan 11, 2016 at 06:50:39PM -0600, OpenBMC Patches wrote:
> From: shgoupf <shgoupf@cn.ibm.com>

(snip)

> -        memcpy(response, &buf, *data_len);
> +        uint64_t return_value;
> +        sscanf(buf, "%PRIx64", &return_value);

I just noticed this change from the previous version; have you tested
this? I believe you need to use the PRIx64 specifier like this:

	sscanf(buf, "%" PRIx64, &return_value);

Where PRIx64 is not within the quotes. Do you get an error when you
build this?

Regards,
Sam Mendoza-Jonas
