Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVJYj67hJzDqTV
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 16:50:01 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 22 Mar 2016 23:49:59 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 22 Mar 2016 23:49:57 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 060C1C40001
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 23:38:05 -0600 (MDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2N5nuEZ27852962
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 05:49:56 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2N5nu5i026028
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:49:56 -0400
Received: from birb.localdomain ([9.81.203.178])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u2N5nitZ025140; Wed, 23 Mar 2016 01:49:54 -0400
Received: by birb.localdomain (Postfix, from userid 1000)
 id E9C47229EAA0; Wed, 23 Mar 2016 16:49:39 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: Re: [PATCH skeleton v2 03/11] fix info memory leak
In-Reply-To: <1458701445-31175-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458701445-31175-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1458701445-31175-4-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 23 Mar 2016 16:49:39 +1100
Message-ID: <87oaa5yc98.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16032305-8236-0000-0000-000018A83FFB
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
X-List-Received-Date: Wed, 23 Mar 2016 05:50:02 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> diff --git a/objects/info.c b/objects/info.c
> index ab2d98c..76c17d9 100644
> --- a/objects/info.c
> +++ b/objects/info.c
> @@ -145,7 +145,7 @@ int get_hdd_status(void)
>  
>      g_read_tmp[2]=g_read_bytes[2];
>      g_read_tmp[3]=g_read_bytes[3];
> -
> +    close(fd);
>  }

Your commit message doesn't match this change. Here you fix a *file
descriptor* leak, not a memory leak.

-- 
Stewart Smith
OPAL Architect, IBM.
