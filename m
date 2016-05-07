Return-Path: <benh@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1ptW5RHZzDq6B
 for <openbmc@lists.ozlabs.org>; Sat,  7 May 2016 10:09:55 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Sat, 7 May 2016 10:09:54 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 7 May 2016 10:09:51 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id D3AA82BB0054
 for <openbmc@lists.ozlabs.org>; Sat,  7 May 2016 10:09:50 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4709gE658916966
 for <openbmc@lists.ozlabs.org>; Sat, 7 May 2016 10:09:50 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4709ID9005158
 for <openbmc@lists.ozlabs.org>; Sat, 7 May 2016 10:09:18 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4709Hax004872; Sat, 7 May 2016 10:09:17 +1000
Received: from pasglop (unknown [9.192.180.145])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 20F72A0196;
 Sat,  7 May 2016 10:08:53 +1000 (AEST)
Message-ID: <1462579733.20290.71.camel@au1.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Date: Sat, 07 May 2016 10:08:53 +1000
In-Reply-To: <20160506111934.GA9580@gwshan>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com> <20160506111934.GA9580@gwshan>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050700-0021-0000-0000-000009812ABD
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
X-List-Received-Date: Sat, 07 May 2016 00:09:55 -0000

On Fri, 2016-05-06 at 21:19 +1000, Gavin Shan wrote:
> I will investigate it when getting a chance. It seems Pin multiplexing
> isn't configured correctly for RGMII in uboot. I dumped the MAC control
> register (offset: 0x50). We have 100Mb mode there in uboot.

Can we fix this or is this dependent on the straps ? What is the straps
settings ? Can it be changed in SW ?

Cheers,
Ben.
