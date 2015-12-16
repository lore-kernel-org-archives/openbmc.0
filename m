Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 920C71A0B9B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:26:58 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 15 Dec 2015 23:26:56 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Dec 2015 23:26:55 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id F19523E4003E
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:26:54 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6QssV28114976
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:26:54 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6Qsll007801
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:26:54 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6QrRg007762; Tue, 15 Dec 2015 23:26:54 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4F8482286E32; Wed, 16 Dec 2015 17:26:47 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: Re: [PATCH openbmc] Add flash copy commands to busybox
In-Reply-To: <1449711036-9716-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449711036-9716-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449711036-9716-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 17:26:47 +1100
Message-ID: <87poy67vtk.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121606-0021-0000-0000-000015516C9B
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
X-List-Received-Date: Wed, 16 Dec 2015 06:26:59 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>
> The flashcp command will copy a file to a mtd device after erasing the
> partition.   This is useful for updating the bmc u-boot, kernel,
> environment, and/or initrd.  It can also be used for upating the whole
> pnor, or partitions if we later add ffs partition parsing.

FYI, I'm going to add FFS partitioning to pflash (for creating/editing
partitions) and then we can just use it everywhere (during build of pnor
image, on BMC and on host).

This should (in total) be a few tens of thousands LoC less.
