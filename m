Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0B5841A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 14:55:00 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 28 Jan 2016 22:54:58 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 28 Jan 2016 22:54:57 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id D22C3C90027
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 22:54:54 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T3su2226738896
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 03:54:56 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T3nspl007824
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 22:49:54 -0500
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.228])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T3nhmu007687; Thu, 28 Jan 2016 22:49:53 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id EB2C92298E45; Fri, 29 Jan 2016 14:54:41 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v9] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <1453445426-28994-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453445426-28994-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453445426-28994-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 29 Jan 2016 14:54:41 +1100
Message-ID: <87y4b9yr9a.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012903-0045-0000-0000-0000032DFE8D
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
X-List-Received-Date: Fri, 29 Jan 2016 03:55:01 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>  struct get_sys_boot_options_t {
>      uint8_t parameter;
>      uint8_t set;
>      uint8_t block;
>  }  __attribute__ ((packed));
>  
> +struct set_sys_boot_options_t {
> +    uint8_t parameter;
> +    union {
> +        struct {
> +            uint8_t d1;
> +            uint8_t d2;
> +            uint8_t d3;
> +            uint8_t d4;
> +            uint8_t d5;
> +            uint8_t d6;
> +            uint8_t d7;
> +            uint8_t d8;
> +        } data8;
> +        uint64_t data64;
> +    } data;
> +}  __attribute__ ((packed));

Why not "uint8_t d[8]" ?


-- 
Stewart Smith
OPAL Architect, IBM.
