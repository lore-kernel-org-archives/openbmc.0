Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BAF9D1A02CF
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2016 18:27:46 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 8 Feb 2016 00:27:44 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 8 Feb 2016 00:27:42 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 22A783E40030
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2016 00:27:42 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u187Rgf922806744
 for <openbmc@lists.ozlabs.org>; Mon, 8 Feb 2016 00:27:42 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u187Rf3I031619
 for <openbmc@lists.ozlabs.org>; Mon, 8 Feb 2016 00:27:41 -0700
Received: from birb.localdomain ([9.81.198.107])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u187RWEK031360; Mon, 8 Feb 2016 00:27:41 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 851CC2286E35; Mon,  8 Feb 2016 18:27:30 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH rest-dbus] Fix pep8 errors
In-Reply-To: <1454819437-24544-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454819437-24544-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454819437-24544-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 08 Feb 2016 18:27:30 +1100
Message-ID: <87twljwtjx.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16020807-0025-0000-0000-00002125F9E3
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
X-List-Received-Date: Mon, 08 Feb 2016 07:27:47 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

Looks okay, I think commit message should mention that this is just a
whitespace fix though.

-- 
Stewart Smith
OPAL Architect, IBM.
