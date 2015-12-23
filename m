Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 701C01A08ED
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2015 12:09:56 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 22 Dec 2015 18:09:53 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 22 Dec 2015 18:09:51 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5F2D219D8026
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2015 17:57:54 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBN19o7X18743486
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2015 18:09:50 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBN19ok4011898
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2015 18:09:50 -0700
Received: from birb.localdomain ([9.81.192.176])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 tBN19exF011564; Tue, 22 Dec 2015 18:09:49 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id F0C60229EAB2; Wed, 23 Dec 2015 12:09:37 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: Re: [PATCH skeleton 03/15] Fix THROTTLE typo:
In-Reply-To: <1450482035-4530-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450482035-4530-4-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 23 Dec 2015 12:09:37 +1100
Message-ID: <87egeekm26.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15122301-0021-0000-0000-0000157CFA2E
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
X-List-Received-Date: Wed, 23 Dec 2015 01:09:57 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Ken <ken.sk.lai@mail.foxconn.com>
>
> ---
>  objects/control_host_obj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
> index 56b02de..ac72b6e 100755
> --- a/objects/control_host_obj.c
> +++ b/objects/control_host_obj.c
> @@ -21,7 +21,7 @@ GPIO fsi_data     = (GPIO){ "FSI_DATA" };
>  GPIO fsi_clk      = (GPIO){ "FSI_CLK" };
>  GPIO fsi_enable   = (GPIO){ "FSI_ENABLE" };
>  GPIO cronus_sel   = (GPIO){ "CRONUS_SEL" };
> -GPIO Throttle   = (GPIO){ "BMC_TROTTLE" };
> +GPIO Throttle     = (GPIO){ "BMC_THROTTLE" };
>  
>  /* Bit bang patterns */

Should be squashed into previous commit.
