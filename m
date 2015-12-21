Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0D6BD1A170E
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2015 14:10:30 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 20 Dec 2015 22:10:27 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 20 Dec 2015 22:10:26 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 09CD138C8026
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 21:57:43 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBL3APHG23330998
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2015 03:10:25 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBL3AOj8024515
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 22:10:24 -0500
Received: from birb.localdomain ([9.80.227.185])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBL3ANdZ024465; Sun, 20 Dec 2015 22:10:24 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 551702286E32; Mon, 21 Dec 2015 14:10:18 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Vishwanatha Subbanna <vishwanath@in.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3 1/6] Support host reboot
In-Reply-To: <201512170646.tBH6kaOR019514@d28av01.in.ibm.com>
References: <1450270225-2497-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450270225-2497-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87wpse5bkf.fsf@birb.au.ibm.com>
 <201512170646.tBH6kaOR019514@d28av01.in.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 21 Dec 2015 14:10:18 +1100
Message-ID: <874mfcmr8l.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
x-cbid: 15122103-0045-0000-0000-000002E3ABE9
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
X-List-Received-Date: Mon, 21 Dec 2015 03:10:31 -0000

Vishwanatha Subbanna <vishwanath@in.ibm.com> writes:

> CMD_POWER_OFF is for soft-off.
>
> CMD_HARD_RESET is for hard reset.

Why not spell that out in the defines?

CMD_SOFT_POWER_OFF
CMD_HARD_RESET

which would imply the existence of:
CMD_HARD_POWER_OFF
CMD_SOFT_RESET

Having hard/soft in define means it's obvious to anyone reading the code
as to what it's meant to be doing.
