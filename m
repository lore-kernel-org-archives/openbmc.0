Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 808631A1853
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:42:07 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 23:42:05 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 23:42:02 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 4088438C8039
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 23:42:02 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C4g2DJ27656416
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 04:42:02 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C4bj2g015956
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 23:37:45 -0500
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.230])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C4bbHQ015770; Mon, 11 Jan 2016 23:37:44 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9726C22B7CFE; Tue, 12 Jan 2016 15:41:50 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Antony Messerli <amesserl@rackspace.com>
Subject: Re: [PATCH openbmc v2] Adding Fedora 23 requirements to README
In-Reply-To: <1452353420-26955-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452353420-26955-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452353420-26955-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 15:41:50 +1100
Message-ID: <87wprfcstt.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011204-0041-0000-0000-000003007038
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
X-List-Received-Date: Tue, 12 Jan 2016 04:42:08 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Antony Messerli <amesserl@rackspace.com>
>
> ---
>  README.md | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>

Personally, I'd love to see Dockerfiles present and then use these
during automated build so that we *programatically* test build
dependencies.

In the meantime, README additions look good.

-- 
Stewart Smith
OPAL Architect, IBM.
