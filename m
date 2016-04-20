Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqpdB3S5MzDqZT
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 03:23:42 +1000 (AEST)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 20 Apr 2016 11:23:40 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 11:23:38 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 5B95A3E4001C
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:23:38 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KHNcaC32243912
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 10:23:38 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KHNb11029520
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:23:38 -0600
Received: from birb.localdomain ([9.80.196.127])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KHNZnk029412; Wed, 20 Apr 2016 11:23:37 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id DD8192298E45; Wed, 20 Apr 2016 10:23:24 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: Re: [PATCH skeleton v6 19/20] Support FAN LED feature
In-Reply-To: <1460703717-23960-20-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460703717-23960-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460703717-23960-20-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 20 Apr 2016 10:23:24 -0700
Message-ID: <87oa94kxdf.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042017-0029-0000-0000-0000238A39C6
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
X-List-Received-Date: Wed, 20 Apr 2016 17:23:43 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> +const char *fanInObjPath [NUM_FAN] = {"/org/openbmc/sensors/tach/fan0H",
> +				"/org/openbmc/sensors/tach/fan0L",
> +				"/org/openbmc/sensors/tach/fan1H",
[ 7 more citation lines. Click/Enter to show. ]
> +				"/org/openbmc/sensors/tach/fan1L",
> +				"/org/openbmc/sensors/tach/fan2H",
> +				"/org/openbmc/sensors/tach/fan2L",
> +				"/org/openbmc/sensors/tach/fan3H",
> +				"/org/openbmc/sensors/tach/fan3L",
> +				"/org/openbmc/sensors/tach/fan4H",
> +				"/org/openbmc/sensors/tach/fan4L",
> +				"/org/openbmc/sensors/tach/fan5H",
> +				"/org/openbmc/sensors/tach/fan5L",
> +				};

How can we not hardcode all of these?

-- 
Stewart Smith
OPAL Architect, IBM.
