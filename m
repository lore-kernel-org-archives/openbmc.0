Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 236D21A0B9B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:21:58 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 16 Dec 2015 01:21:56 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 01:21:55 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 5826FC90041
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 01:10:03 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6Lskv27066526
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 06:21:54 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6LrQN012436
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 01:21:54 -0500
Received: from birb.localdomain ([9.192.255.109])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6LrcJ012393; Wed, 16 Dec 2015 01:21:53 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 44BDB2286E32; Wed, 16 Dec 2015 17:21:51 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 17:21:51 +1100
Message-ID: <87vb7y7w1s.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121606-0045-0000-0000-000002C5565B
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
X-List-Received-Date: Wed, 16 Dec 2015 06:21:59 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: shgoupf <shgoupf@cn.ibm.com>

Commit message?
