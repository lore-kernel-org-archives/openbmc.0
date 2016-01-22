Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 09AB21A0562
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 13:16:35 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 21 Jan 2016 19:16:33 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Jan 2016 19:16:32 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0D8F919D8040
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 19:04:32 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0M2GVNE26149056
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 19:16:31 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0M2GV3V022404
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 19:16:31 -0700
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.228])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0M2GMXr021877; Thu, 21 Jan 2016 19:16:30 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id B35B9229EA9A; Fri, 22 Jan 2016 13:16:19 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 0/6] Persistent 1
In-Reply-To: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 22 Jan 2016 13:16:19 +1100
Message-ID: <878u3i5pfw.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012202-8236-0000-0000-000015681623
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
X-List-Received-Date: Fri, 22 Jan 2016 02:16:36 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> The openbmc-phosphor include has been updated to build two
> file systems: an initramfs packaged into an initrd for
> setting up the root file system, and a read-only squashfs
> with xz compression to hold the main data.  The final 4MB
> of the 32MB flash is used to hold a read/write overlay over
> the squashfs maintaining updates for any files changed
> that are not mounted in a tmpfs directory.

<snip>

> The first-boot is triggering systemd-update-hwdb.service which is trying
> to recreate a 60MB file in our 4MB file system.  It obviously fails, but
> it also sometimes times out and causes the ttyS4.device and ttyS0.device
> files that are trying to run concurrently to also fail.   This causes the
> console getty to not be started.  If this occurs you can login over the
> network if you had previously setup systemd (or set ip= in bootargs from
> u-boot), otherwise you will need to reboot then address the unclean ext4
> fsck issue above.

While this probably isn't a too bad stop-gap measure, fundamentally,
it's probably better to have all persistent data in a specfiic
mountpoint so that the BMC stack itself can be near impossible to modify
(err... backdoor) at runtime.

With a persistent overlay, it makes it much easier to persistently
backdoor the BMC (which isn't ideal).

Do we have a plan to head towards something like:
- root on dm_verify
- root mounted ro
- strong, enforcing SELinux
- all persistent data on /data or somewhere, no exec, and all that jazz

?

-- 
Stewart Smith
OPAL Architect, IBM.
