Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrDwg5lcLzDqcm
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 20:08:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qrDwg1tCHz9t3Z;
 Thu, 21 Apr 2016 20:08:35 +1000 (AEST)
Subject: Re: [PATCH phosphor-host-ipmid] Support for restricted mode for IPMI
 commands
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <1459194642-16791-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459194642-16791-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: tomjose <tomjoseph@in.ibm.com>
Message-ID: <5718A69F.3060902@ozlabs.org>
Date: Thu, 21 Apr 2016 18:08:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1459194642-16791-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 21 Apr 2016 10:08:35 -0000

Hi Tom,

> From: tomjose <tomjoseph@in.ibm.com>

Can you use a full name for the commit, and add some detail to the
commit log?

Also, you may want to check out our contributing guidelines:

  https://github.com/openbmc/docs/blob/master/contributing.md

> @@ -88,6 +89,12 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      *data_len = 0;
>  
>      printf("IPMI SET ACPI STATE Ignoring for now\n");
> +
> +    if(restricted_mode)
> +    {
> +        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
> +    }
> +
>      return rc;
>  }

I don't think this is a maintainable method of implementing restricted
mode, for a couple of reasons:

 - The checks are scattered throughout the codebase. We would have to
   audit every ipmi function to check that restricted mode is
   implemented properly.

 - If we add new commands, we have no way to ensure the whitelist is
   implemented correctly for that command.

We'd be better off implementing the check at a single location, where
the IPMI command is first demultiplexed. This way, we can audit it in a
central location, and have a single list of whitelisted commands.

I'd suggest we have a function, looking something like:

struct {
	ipmi_netfn_t	netfn;
	ipmi_cmd_t	cmd;
} ipmi_whitelist[] = {
	{ NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL },
	....
}

bool ipmi_command_is_allowed(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
	void *data)
{
	int i;

	if (!restricted_mode)
		return true;

	for (i = 0; i < ARRAY_SIZE(ipmi_whitelist); i++) {
		if (netfn == ipmi_whitelist[i].netfn &&
				cmd == ipmi_whitelist[i].cmd)
			return true;
	}

	return false;
}

this would be called from handle_ipmi_command, before we route it to a
handler; if it returns false there, the we return
IPMI_CC_INSUFFICIENT_PRIVILEGE immediately.

This way, we have a whitelist rather than a blacklist, and we can audit
it much more easily.

Regards,


Jeremy
