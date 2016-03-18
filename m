Return-Path: <andrew.donnellan@au1.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qR77D6bj8zDqGd
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 12:34:32 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <andrew.donnellan@au1.ibm.com>;
 Fri, 18 Mar 2016 11:34:30 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 18 Mar 2016 11:34:27 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: andrew.donnellan@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id A596D2BB0071
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 12:33:54 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2I1XOwI39846054
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 12:33:49 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2I1Wd2l032273
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 12:32:39 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2I1WbAt031415; Fri, 18 Mar 2016 12:32:38 +1100
Received: from [10.61.2.248] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DB64CA0120;
 Fri, 18 Mar 2016 12:31:13 +1100 (AEDT)
Subject: Re: [PATCH] inarp: Update to 19ed5170
To: Patrick Williams <patrick@stwcx.xyz>, Jeremy Kerr <jk@ozlabs.org>
References: <1458209312-4881-1-git-send-email-jk@ozlabs.org>
 <20160317163517.GD6045@asimov.austin.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Message-ID: <56EB5A61.9080504@au1.ibm.com>
Date: Fri, 18 Mar 2016 12:31:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160317163517.GD6045@asimov.austin.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16031801-0025-0000-0000-00000377017B
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
X-List-Received-Date: Fri, 18 Mar 2016 01:34:33 -0000

On 18/03/16 03:35, Patrick Williams wrote:
> Did you use 'git send-email' for this instead of a github pull request?
> Without a pull request we don't currently have a mechanism to trigger
> Jenkins to test.

A few of us are working on this, hopefully we'll have something to share 
shortly :)

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
