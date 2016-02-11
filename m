Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A276C1A001D
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:57:05 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 10 Feb 2016 20:57:03 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 Feb 2016 20:57:01 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id CDD7B1FF0045
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 20:45:10 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1B3v08P24379410
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 20:57:00 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1B3v01p028149
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 20:57:00 -0700
Received: from birb.localdomain ([9.83.0.6])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1B3upLE027682; Wed, 10 Feb 2016 20:57:00 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0A6142286E20; Thu, 11 Feb 2016 14:56:50 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] IPMI Get IP Support
In-Reply-To: <1455134445-29477-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455134445-29477-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455134445-29477-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 11 Feb 2016 14:56:49 +1100
Message-ID: <87wpqbq4qm.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021103-0005-0000-0000-00001C479625
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
X-List-Received-Date: Thu, 11 Feb 2016 03:57:06 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> +        while (digit != NULL)
> +        {
> +            int resp_byte = strtoul(digit, NULL, 10);
> +            memcpy((void*)&buf[i+1], &resp_byte, 1);

memcpy here? Really?

-- 
Stewart Smith
OPAL Architect, IBM.
