Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DAB91A1176
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 22:29:02 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 16 Dec 2015 04:29:00 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 04:28:40 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id F260219D8041
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 04:16:43 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBGBSdLN28639378
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 04:28:39 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBGBSc5a014163
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 04:28:38 -0700
Received: from birb.localdomain ([9.80.207.207])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBGBSbxn014120; Wed, 16 Dec 2015 04:28:38 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id E97322286E32; Wed, 16 Dec 2015 22:28:29 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Peng Fei BG Gou <shgoupf@cn.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <201512161003.tBGA3f0Y023599@d23av02.au.ibm.com>
References: <87mvta7uel.fsf@birb.au.ibm.com> <87vb7y7w1s.fsf@birb.au.ibm.com>
 <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201512160627.tBG6RTg8006339@d23av06.au.ibm.com>
 <201512161003.tBGA3f0Y023599@d23av02.au.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 22:28:29 +1100
Message-ID: <87k2oe7huq.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121611-0013-0000-0000-00001B181A8C
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
X-List-Received-Date: Wed, 16 Dec 2015 11:29:03 -0000

Peng Fei BG Gou <shgoupf@cn.ibm.com> writes:
> I'm sorry that for my commits I only have "1 line" comments for them.
> I will try to fix them by changing the comments that already been
> committed. But there are plenty of commits that is "1 line" comments
> as below. So would you mind telling me in what situation I am allowed
> to have "1 line" comment and in what situation I need to have a
> multiple-line comment?

Yeah, there's a lot of poor commit messages in OpenBMC so far, which
gives you the opportunity to be much better than others!

Personally, my guide is: if someone casually familiar with the project
and concepts can see that the patch is obviously correct in less than
four seconds, a one line commit message is okay.

My goal for a commit message is to give enough information to someone
casually familiar with the project and subject matter enough to go and
start to learn enough to completely understand the patch.

Even then, sometimes a bit more info is useful.
For example:
https://github.com/open-power/skiboot/commit/d4b142823e28deed097cf79b25d8d1e60b6f4e67

An example of single line commit message:
https://github.com/open-power/skiboot/commit/916196d4cc0e070369ff6aa1363fa39339f8cad1
(which is just adding release notes, so it's *obvious* what this patch
does)

Or
https://github.com/torvalds/linux/commit/5c477b45792fb8ccd279162483aa57cc8ee40ae1
which is just the wiring up of a new syscall for PARISC.
