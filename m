Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWT/yTUE"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynCr55VN4zDqpc
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 08:11:01 +1100 (AEDT)
Received: by mail-pf0-x244.google.com with SMTP id j124so2129267pfc.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RxzKIAQTOiwLTzVcqwqvFKkWN5+fm5AgPsbhTojjHhM=;
 b=cWT/yTUEL3IGWHX8A0SAAEQVbCA9nowJHib3nburzo2TeV1q5hWfeFHyqXC/YdgSmf
 FjAGOBdQtBm6cmqRJF6geqP4COqfK/JaBTYJBbxMwyOBWDYbMeCP8mM3B8DDH1FIiaOG
 ydHEmN1o8Np3YGMgczk6ph48w+LI4HxA16blJXV2Qhhc6W2zIgSSKHPh0HZQFjwgQqJo
 rAksrdPkoI5kQqaMflmpNKkl0SlpmvZS679SZOoU5rd0m2MERrZQzrM+Hq9/DyOSat02
 qQX+IvWH5EMoWrPBL/W5322hueRdUw9dWdPZyNIEwgPQ6OgqxqprfgavHx3aLv/8yf76
 m24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RxzKIAQTOiwLTzVcqwqvFKkWN5+fm5AgPsbhTojjHhM=;
 b=KJHidMYILUxQn8bYPk/5ki7voZm3DtDoZ4sZgotXWdeyOj5GoxJrRsnjc79OEQCy1/
 GEFZjkXFAvyzN/gPRmZTJ0fKTBRxpXdnwgU0gIaQSjx9B83cE9XmI8ZuGFJRI159ZSpH
 PKUHpzz4lRS+b17wBIMLi+NtkGiyHNnnzCQ8ND+tUPy7XXEuwEzlHHPa/sejCZvaJQrr
 prhZXwEirncBGrdcYEQf5Bhx0aL8WfvMfpbnUSLZ329Og10wKEcgZOWHQTwHmYZytZ/I
 vHzfOSw6aOWN/tjPUrzkOEj6zLHuE9vMWCFZQ71ciGKkf5ZJNBIOfosq3obNRjWR0ndF
 LcAQ==
X-Gm-Message-State: AJaThX72o7q9taAXY20kde34stOAgDslcZAIELTX0UNYARWZmBAR66uG
 423yftpwuyD/YThgqUj110M=
X-Google-Smtp-Source: AGs4zMZPBxx09hQXXM4zRmGTlj+uIVOiQ212ubCn7BVsSiiypHcDjpi+Sjn8SCo2kxnLf3niBJmBzw==
X-Received: by 10.99.115.85 with SMTP id d21mr228798pgn.82.1511989858646;
 Wed, 29 Nov 2017 13:10:58 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id f79sm4616541pfd.45.2017.11.29.13.10.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Nov 2017 13:10:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Nov 2017 13:10:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v6,1/4] pmbus (core): Add fan control support
Message-ID: <20171129211056.GA21396@roeck-us.net>
References: <3b782897affbb8ffe51d6b87d8c48fdcbb84e33e.1511152748.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b782897affbb8ffe51d6b87d8c48fdcbb84e33e.1511152748.git-series.andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 21:11:02 -0000

On Mon, Nov 20, 2017 at 03:12:03PM +1030, Andrew Jeffery wrote:
> Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.
> 
> Fans in a PMBus device are driven by the configuration of two registers,
> FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
> and the tacho operate (if installed), while FAN_COMMAND_x sets the
> desired fan rate. The unit of FAN_COMMAND_x is dependent on the
> operational fan mode, RPM or PWM percent duty, as determined by the
> corresponding configuration in FAN_CONFIG_x_y.
> 
> The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y and
> FAN_COMMAND_x is implemented with the addition of virtual registers to
> facilitate the necessary side-effects of each access:
> 
> 1. PMBUS_VIRT_FAN_TARGET_x
> 2. PMBUS_VIRT_PWM_x
> 3. PMBUS_VIRT_PWM_ENABLE_x
> 
> Some complexity arises with the fanX_target and pwmX attributes both mapping
> onto FAN_COMMAND_x: There is no general mapping between PWM percent duty and
> RPM, so we can't display values in either attribute in terms of the other
> (which in my mind is the intuitive, if impossible, behaviour). This problem
> also affects the pwmX_enable attribute which allows userspace to switch between
> full speed, manual PWM and a number of automatic control modes, possibly
> including a switch to RPM behaviour (e.g. automatically adjusting PWM duty to
> reach a RPM target, the behaviour of fanX_target).
> 
> The next most intuitive behaviour is for fanX_target and pwmX to simply be
> independent, to retain their most recently set value even if that value is not
> active on the hardware (due to switching to the alternative control mode). This
> property of retaining the value independent of the hardware state has useful
> results for both userspace and the kernel: Userspace always sees a sensible
> value in the attribute (the last thing it was set to, as opposed to 0 or
> receiving an error on read), and the kernel can use the attributes as a value
> cache. This latter point eases the implementation of pwmX_enable, which can
> look up the associated pmbus_sensor object, take its cached value and apply it
> to hardware on changing control mode. This ensures we will not arbitrarily set
> a PWM value as an RPM value or vice versa, and we can assume that the RPM or
> PWM value set was sensible at least at some point in the past.
> 
> Finally, the DIRECT mode coefficients of some controllers is different between
> RPM and PWM percent duty control modes, so PSC_PWM is introduced to capture the
> necessary coefficients. As pmbus core had no PWM support previously PSC_FAN
> continues to be used to capture the RPM DIRECT coefficients, but in order to
> avoid falsely applying RPM scaling to PWM values I have introduced the
> PMBUS_HAVE_PWM12 and PMB_BUS_HAVE_PWM34 feature bits. These feature bits allow
> drivers to explicitly declare PWM support in order to have the attributes
> exposed.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Appled (fixed whitespace problem).

Thanks,
Guenter
