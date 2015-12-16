Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3EE8E1A06C9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 08:27:42 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 16 Dec 2015 16:27:39 -0500
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 16:27:27 -0500
X-IBM-Helo: b03cxnp08028.gho.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBGLRGdH21233860
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 14:27:16 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBGLRGH2024635
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 14:27:16 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBGLRD0I024232; Wed, 16 Dec 2015 14:27:14 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4C6F72286E41; Thu, 17 Dec 2015 08:27:12 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3 1/6] Support host reboot
In-Reply-To: <1450270225-2497-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450270225-2497-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450270225-2497-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 17 Dec 2015 08:27:12 +1100
Message-ID: <87wpse5bkf.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
x-cbid: 15121621-0045-0000-0000-000002C8928A
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
X-List-Received-Date: Wed, 16 Dec 2015 21:27:43 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> @@ -89,11 +90,11 @@ ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  	switch(chassis_ctrl_cmd)
>  	{
>  		case CMD_POWER_OFF:
> +			rc = ipmi_chassis_power_control("powerOff");
> +			break;

Is this a hard power off or a soft one?
