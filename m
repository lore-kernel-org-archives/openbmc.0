Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qq9wN5RJrzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 02:49:40 +1000 (AEST)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 19 Apr 2016 10:49:37 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Apr 2016 10:49:36 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 7DAEF19D8058
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 10:37:26 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3JGnZQn41681052
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 09:49:35 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3JGnYcK003717
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 10:49:35 -0600
Received: from birb.localdomain ([9.80.219.12])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3JGnWlp003546; Tue, 19 Apr 2016 10:49:33 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9013B229DB29; Tue, 19 Apr 2016 09:49:21 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2 1/2] Adding Boot Policy
In-Reply-To: <1460978439-16510-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460978439-16510-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460978439-16510-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 19 Apr 2016 09:49:21 -0700
Message-ID: <87d1plo86m.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16041916-0029-0000-0000-000023718081
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
X-List-Received-Date: Tue, 19 Apr 2016 16:49:41 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: ratagupt <ratagupt@in.ibm.com>

Also please use "First Last <foo@bar>" (i.e. full name) as user for
git. It helps tracking commits back to people.

-- 
Stewart Smith
OPAL Architect, IBM.
