Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqpbn4yDTzDqZK
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 03:22:29 +1000 (AEST)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 20 Apr 2016 11:22:27 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 11:22:25 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0679219D8048
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:10:16 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KHMOFd21299400
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 10:22:24 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KHMOT2024594
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:22:24 -0600
Received: from birb.localdomain ([9.80.196.127])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KHMMfi024448; Wed, 20 Apr 2016 11:22:24 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id C30002298E45; Wed, 20 Apr 2016 10:21:57 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: Re: [PATCH skeleton v6 10/20] Modify the hard-coded hwmon ID for
 PowerCap
In-Reply-To: <1460703717-23960-11-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460703717-23960-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460703717-23960-11-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 20 Apr 2016 10:21:57 -0700
Message-ID: <87twiwkxfu.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042017-0009-0000-0000-00002176370E
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
X-List-Received-Date: Wed, 20 Apr 2016 17:22:30 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: johnhcwang <hsienchiang@gmail.com>
>
> After we enable I2C-6 lm75 outlet sensor in device stree, the hwmon ID
> of PowerCap won't be 3 anymore. So we have to modify it as real ID.

This looks like a pretty unreliable way to identify the sensor we
want. Surely there's a better way than just relying on them always
coming up in the same order?


-- 
Stewart Smith
OPAL Architect, IBM.
