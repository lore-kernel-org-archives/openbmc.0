Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqpYC3KQRzDqbD
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 03:20:15 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 20 Apr 2016 13:20:13 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 13:20:10 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 6381CC90042
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 13:19:53 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KHJw9539190682
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 17:19:58 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KHJwDG013600
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 13:19:58 -0400
Received: from birb.localdomain ([9.80.196.127])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KHJwAB013576; Wed, 20 Apr 2016 13:19:58 -0400
Received: by birb.localdomain (Postfix, from userid 1000)
 id D969E229EAA9; Wed, 20 Apr 2016 10:19:55 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: Re: [PATCH skeleton v6 03/20] fix info memory leak
In-Reply-To: <1460703717-23960-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460703717-23960-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460703717-23960-4-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 20 Apr 2016 10:19:55 -0700
Message-ID: <87zisokxj8.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042017-0041-0000-0000-000003EDE477
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
X-List-Received-Date: Wed, 20 Apr 2016 17:20:16 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Ken <ken1029@gmail.com>

please use full name.

> ---
>  objects/info.c | 2 +-
[ 10 more citation lines. Click/Enter to show. ]
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
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

Please squash into previous commit.

-- 
Stewart Smith
OPAL Architect, IBM.
