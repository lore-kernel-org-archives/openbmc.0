Return-Path: <benh@au1.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 293491A0054
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 10:25:28 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 28 Jan 2016 09:25:27 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 28 Jan 2016 09:25:24 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id BAF583578056
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 10:25:23 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0RNPHQB10289366
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 10:25:25 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0RNOoDJ005250
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 10:24:51 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0RNOoki004886; Thu, 28 Jan 2016 10:24:50 +1100
Received: from pasglop.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 702F4A0124;
 Thu, 28 Jan 2016 10:24:26 +1100 (AEDT)
Message-ID: <1453937066.3148.28.camel@au1.ibm.com>
Subject: Re: [PATCH skeleton v2] Refactored LED control dbus methods
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Patches
 <openbmc-patches@stwcx.xyz>, vishwanath@in.ibm.com
Cc: openbmc@lists.ozlabs.org
In-Reply-To: <20160127145416.6569f93b@camb691>
References: <1453465242-8067-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453465242-8067-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160127145416.6569f93b@camb691>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012723-1618-0000-0000-000003950D6C
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
Date: Wed, 27 Jan 2016 23:25:29 -0000
X-Original-Date: Thu, 28 Jan 2016 10:24:26 +1100
X-List-Received-Date: Wed, 27 Jan 2016 23:25:29 -0000

On Wed, 2016-01-27 at 14:54 +1100, Cyril Bur wrote:
> +const char *power_ctrl = "brightness";
> > +const char *blink_ctrl = "trigger";
> > +const char *duty_on   = "delay_on";
> > +const char *duty_off  = "delay_off";
> 
> Why can't these be #defined?

Ugh ? A const string is better, more strongly typed and guarantees
there is going to be only one (though compilers are smart these days).

Cheers,
Ben.
