Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1E3FE1A0060
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:25:48 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 8 Mar 2016 22:25:46 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Mar 2016 22:25:43 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id A8BA51FF001E
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 22:13:52 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id u295Ph6B33751134
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 22:25:43 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u295Pgsr023276
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 22:25:42 -0700
Received: from birb.localdomain ([9.81.200.75])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u295PWIE022784; Tue, 8 Mar 2016 22:25:41 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 12530229DB26; Wed,  9 Mar 2016 16:25:30 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid v2] DCMI GET_POWER_LEVEL bad return
 code
In-Reply-To: <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 09 Mar 2016 16:25:30 +1100
Message-ID: <87io0w9q9h.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16030905-8236-0000-0000-000016F88861
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
X-List-Received-Date: Wed, 09 Mar 2016 05:25:49 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Norman James <njames@us.ibm.com>
>
> This function uses static data and should always
> return a good return code.  This was causing OCC
> not to start.
>
> Signed-off-by: Norman James <nkskjames@gmail.com>
> ---
>  dcmihandler.C | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/dcmihandler.C b/dcmihandler.C
> index fafebdc..5e7d879 100644
> --- a/dcmihandler.C
> +++ b/dcmihandler.C
> @@ -11,7 +11,7 @@ ipmi_ret_t ipmi_dcmi_get_power_limit(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>                                ipmi_request_t request, ipmi_response_t response, 
>                                ipmi_data_len_t data_len, ipmi_context_t context)
>  {
> -    ipmi_ret_t rc = IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT;
> +    ipmi_ret_t rc = 0;
>  
>      // dcmi-v1-5-rev-spec.pdf 6.6.2.

Shouldn't the value of rc be something that is an ipmi_ret_t ?

>      // This is good enough for OpenBMC support for OpenPOWER based systems
> @@ -37,4 +37,3 @@ void register_netfn_dcmi_functions()
>      ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit);
>      return;
>  }
> -// 956379
> \ No newline at end of file

Above hunk is irrelevant.

-- 
Stewart Smith
OPAL Architect, IBM.
