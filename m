Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0B61C1A170E
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2015 14:14:15 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 20 Dec 2015 20:14:14 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 20 Dec 2015 20:14:11 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id E081219D8040
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 20:02:14 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id tBL3EAgO24641778
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 20:14:10 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBL3EATF016540
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 20:14:10 -0700
Received: from birb.localdomain ([9.80.227.185])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBL3E8V2016444; Sun, 20 Dec 2015 20:14:09 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 051982286E32; Mon, 21 Dec 2015 14:14:02 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Peng Fei BG Gou <shgoupf@cn.ibm.com>, Chris Austen <austenc@us.ibm.com>
Cc: openbmc <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid v3 2/6] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <OF0C1E11C2.B7E518C3-ON48257F1E.001E03A4-48257F1E.001E58F6@cn.ibm.com>
References: <87twni5aqw.fsf@birb.au.ibm.com>
 <OF6CA268B3.D580B2FE-ON00257F1E.0016143E-1450324869873@LocalDomain>
 <OF0C1E11C2.B7E518C3-ON48257F1E.001E03A4-48257F1E.001E58F6@cn.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 21 Dec 2015 14:14:02 +1100
Message-ID: <871tagmr2d.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15122103-0005-0000-0000-00001AC96E6C
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
X-List-Received-Date: Mon, 21 Dec 2015 03:14:16 -0000

Peng Fei BG Gou <shgoupf@cn.ibm.com> writes:
> 2) there is a lot of deletes.  Feels like this needs some additional eyes.
> Yes, this pull request is too dirty and should be ignored.
> Please refer to the new pull request which squashed unnecessary commits and
> patched all together, as below:
> https://github.com/openbmc/phosphor-host-ipmid/pull/55

Please fix your mail client to properly quote.

Note that this is impossible with IBM Verse: go get a different mail
client.
