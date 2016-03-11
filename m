Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 232A91A0350
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2016 14:55:41 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 10 Mar 2016 20:55:39 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Mar 2016 20:55:37 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 35BCA3E4003B
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 20:55:37 -0700 (MST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2B3taAV23789626
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2016 03:55:36 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2B3ta2F004194
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 22:55:36 -0500
Received: from birb.localdomain (birb.au.ibm.com [9.185.16.92])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2B3tZql004163; Thu, 10 Mar 2016 22:55:36 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id A926F229DB26; Fri, 11 Mar 2016 14:55:32 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH ipmi-fru-parser] RFC: use cmake.
In-Reply-To: <87y49tb8u9.fsf@linux.vnet.ibm.com>
References: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XeHoDVNgd7WrdX=RuoFcjQJvK4YSh8SLArRJpBuZjbWAQ@mail.gmail.com>
 <20160308025325.GK6601@asimov.pw-on-the.net>
 <87y49tb8u9.fsf@linux.vnet.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 11 Mar 2016 14:55:32 +1100
Message-ID: <87y49p7jnv.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16031103-0025-0000-0000-00002260689C
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
X-List-Received-Date: Fri, 11 Mar 2016 03:55:42 -0000

Stewart Smith <stewart@linux.vnet.ibm.com> writes:
> Patrick Williams <patrick@stwcx.xyz> writes:
>> On Mon, Mar 07, 2016 at 02:30:51PM +1030, Joel Stanley wrote:
>>> On Fri, Mar 4, 2016 at 9:00 AM, OpenBMC Patches
>>> <openbmc-patches@stwcx.xyz> wrote:
>>> > From: Patrick Williams <patrick@stwcx.xyz>
>>> >
>>> > There was a previous proposal to consider autotools (see
>>> > openbmc/ipmi-fru-parser#7).  This is an alternative implementation
>>> > using cmake.
>>> 
>>> I'm not a fan of autotools; I have not chosen to use it on small
>>> projects in the past.
>>> 
>>> That said, I have stopped working on projects due to cmake's
>>> downsides. It's overly complex, and no clear way to implement rules,
>>> making it hard for newbies and experienced developers alike.
>>
>> Can you elaborate on this?  I honestly don't have much experience with
>> CMake but from the little I have played with it it seems 5x easier than
>> makefiles (which autotools still use via Makefile.am).
>
> Some getting started bits are easier in CMake, that's true. But CMake
> misses a few important things:

Tridge on CMake:
https://lists.samba.org/archive/samba-technical/2010-February/069670.html

-- 
Stewart Smith
OPAL Architect, IBM.
