Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E0C6F1A116D
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:57:30 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 15 Dec 2015 23:57:28 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Dec 2015 23:57:26 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 2FDB3C40002
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:45:37 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6vPEP25624734
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:57:26 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6vPLt019118
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:57:25 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6vPXg019086; Tue, 15 Dec 2015 23:57:25 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0D6B02286E32; Wed, 16 Dec 2015 17:57:23 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Peng Fei BG Gou <shgoupf@cn.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <201512160627.tBG6RTg8006339@d23av06.au.ibm.com>
References: <87vb7y7w1s.fsf@birb.au.ibm.com>
 <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201512160627.tBG6RTg8006339@d23av06.au.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 17:57:22 +1100
Message-ID: <87mvta7uel.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121606-0005-0000-0000-00001AAADAA5
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
X-List-Received-Date: Wed, 16 Dec 2015 06:57:31 -0000

Peng Fei BG Gou <shgoupf@cn.ibm.com> writes:
> Sorry. I don't know where are those messages come from. I have pull
> request that is pending but hasn't been reviewed and merged.

When you type "git commit" it opens up an editor.

First line ends up being the subject of the email, the rest is the body,
commonly referred to as "commit message" - first line being a summary of
the change, while the message being more informative.

Anything but the most trivial change should have more than just one line.
