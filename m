Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0E6551A0B9B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:21:02 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 15 Dec 2015 23:21:00 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Dec 2015 23:20:38 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id EC5B2C40001
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:08:48 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6KbhU23920718
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:20:37 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6Kbg2009257
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:20:37 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6Kbwg009226; Tue, 15 Dec 2015 23:20:37 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id EE9242286E32; Wed, 16 Dec 2015 17:20:34 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2 0/5] IPMID boot options changes
In-Reply-To: <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 17:20:34 +1100
Message-ID: <87y4cu7w3x.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121606-0021-0000-0000-000015516780
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
X-List-Received-Date: Wed, 16 Dec 2015 06:21:03 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> shgoupf (5):
>   Add get/set ipmid command support with correct DBUS property handling.
>   Revert "Add get/set ipmid command support with correct DBUS property
>     handling."
>   Redo: Add get/set ipmid boot option command support with correct DBUS
>     property handling.
>   Cleanup codes for ipmid boot option changes.
>   Get service name via object mapper

NACK.

Add, revert, redo is an awful way to do things. One patch, add it right
the first time.
