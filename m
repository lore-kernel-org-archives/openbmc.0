Return-Path: <andrew.donnellan@au1.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1051A1A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:28:38 +1100 (AEDT)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <andrew.donnellan@au1.ibm.com>;
 Fri, 29 Jan 2016 13:28:36 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 29 Jan 2016 13:28:35 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: andrew.donnellan@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 094D02BB0055
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:28:35 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T3SQHw56426684
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:28:34 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T3S23T031259
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:28:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T3S2AP030478
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:28:02 +1100
Received: from [10.61.2.248] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 42F2AA0195
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:27:38 +1100 (AEDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8muWbnuWkje+8mltQQVRDSCBwaG9zcGhvci1yZXN0?=
 =?UTF-8?Q?-server]_The_streaming_support_for_obmc-rest.?=
To: openbmc@lists.ozlabs.org
References: <OF66059493.03804909-ON00257F49.000380B3-1454027895800@LocalDomain>
 <201601290049.u0T0nquh003020@d23av02.au.ibm.com>
 <20160129130826.477d4fcd@camb691>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Message-ID: <56AADC2A.4020101@au1.ibm.com>
Date: Fri, 29 Jan 2016 14:27:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160129130826.477d4fcd@camb691>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012903-0005-0000-0000-0000033721D4
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
X-List-Received-Date: Fri, 29 Jan 2016 03:28:39 -0000

On 29/01/16 13:08, Cyril Bur wrote:
> (unless you want to write a completely separate Python document, and change all
> the python in this project, I suggest we follow this one where appropriate)
>
> 	Indent with tabs instead of spaces, set at 8 columns

As someone who has written Python for a living before - PEP8, please!

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
