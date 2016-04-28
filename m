Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwSYy3d3zzDq62
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:07:02 +1000 (AEST)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 28 Apr 2016 03:06:59 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 28 Apr 2016 03:06:57 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id E660CC90052
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 03:06:50 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3S76uYI34471978
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 07:06:56 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3S76uie005237
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 03:06:56 -0400
Received: from birb.localdomain ([9.83.3.217])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u3S76iBt004315; Thu, 28 Apr 2016 03:06:54 -0400
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0EC00229DB26; Thu, 28 Apr 2016 17:06:21 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] meta-openpower: Bump pflash version to 5.2.1
In-Reply-To: <1461818429-17191-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461818429-17191-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461818429-17191-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 28 Apr 2016 17:06:21 +1000
Message-ID: <87oa8ugqky.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042807-0045-0000-0000-0000040C100F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Thu, 28 Apr 2016 07:07:03 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Joel Stanley <joel@jms.id.au>
>
> No major changes.
>
> Upstream now carries the patch we had in tree, so that can go.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>

-- 
Stewart Smith
OPAL Architect, IBM.
