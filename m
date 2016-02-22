Return-Path: <joel.stanley@au1.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 615901A05D7
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:55:06 +1100 (AEDT)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <joel.stanley@au1.ibm.com>;
 Mon, 22 Feb 2016 10:55:04 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 22 Feb 2016 10:55:02 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: joel.stanley@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 3CB352CE8056
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:55:02 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1M0ssrJ65011732
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:55:02 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1M0sT1G025913
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:54:29 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1M0sTRE025518; Mon, 22 Feb 2016 11:54:29 +1100
Received: from icarus (unknown [9.192.177.121])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3FD41A01EE;
 Mon, 22 Feb 2016 11:54:05 +1100 (AEDT)
Message-ID: <1456102444.15159.3.camel@au1.ibm.com>
Subject: Re: Linux 4.3.x gone?
From: Joel Stanley <joel.stanley@au1.ibm.com>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Cc: Patrick Williams III <iawillia@us.ibm.com>, Jeremy Kerr
 <jeremy.kerr@au1.ibm.com>
Date: Mon, 22 Feb 2016 11:24:04 +1030
In-Reply-To: <201602200707.u1K77Htb001722@d01av03.pok.ibm.com>
References: <201602200707.u1K77Htb001722@d01av03.pok.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16022200-0013-0000-0000-000002C5C5CD
X-Mailman-Approved-At: Tue, 23 Feb 2016 07:11:17 +1100
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
X-List-Received-Date: Mon, 22 Feb 2016 00:55:06 -0000

Hi Chris,

On Sat, 2016-02-20 at 07:07 +0000, Chris Austen wrote:
> http://lkml.iu.edu/hypermail/linux/kernel/1602.2/03670.html
>  
> How does this effect your up-streaming?  When are we moving to 4.4?

This doesn't affect the upstreaming at all. As I mentioned on the call
the other day, I have a tree that is based on 4.5-rc3, and this is what
I will send upstream once we've had a chance to review it.

We can move to 4.4 as soon as you and the rest of the team are
comfortable. As with any change, there is a small risk of regressions,
so we want to do this at an appropriate time.

Cheers,

Joel
