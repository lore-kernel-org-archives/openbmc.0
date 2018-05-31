Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ed9ooJLk"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xScL6RZwzDrYf
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 23:14:58 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id c10-v6so10768278pfi.12
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hP1e7ciPpIiGuuuzI26E/RsRbrxKGFhyaJQLPAF9hJE=;
 b=ed9ooJLkH/9YCocYxUrOG9GcCSCTH9KCnj+oZFHlkS4nKj7YeTRjTokH4sZOv7r2NF
 iTzIooD1d4nRV9VbkTPUEx5rz/HkUo7/+F99Cdj+kSloIPCdyC3TgE8s9SShBX1KmTmT
 Cy2uKR4hGrHW4izTpTBZ2wzlqsl1xdhm3m6LsKK00Up3W3YtMrDHlYOqmG4tONHvStY4
 425HGz07ocL/tk2AuFfthmCzQHvARItegEdkLEOnsr/HSqpiw30eVev2EFPqvM1h1VZJ
 Ybev37p2jv9fqBUYbBazhGQDkG1AIGj1GMcsJ6pgrjMFaOJK0E3JGv53Qb7MHWm34Weg
 Y2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hP1e7ciPpIiGuuuzI26E/RsRbrxKGFhyaJQLPAF9hJE=;
 b=hy9VlfsDMtalpdOz7zTgvIVxlfX1slox+tPPTMD8qbjbRoSDfJP8tFkYnrle/UilE3
 SeHsS3p50/EnD7J/vZNNJSoywidooWZcNzJlFIb1z12Gif1tzZZxKnYGnkdtYMLOrvee
 YvUCQXA4kad1760B7L6sjrmpWg+d3qcAd+Ntf/shkz44TTf8uKkNsm/5F4QDhKECAecG
 swqCtwwdSVitGulZNlzZlooEdfLcaXyiBjlvrklDwnMKQo2w6zvdsWG8BcAViUHIU/Pb
 wWdqimot0B0VCZeMmStLCSx8JDpMeZ21zjI/sn5G8GnEIpxrma8XFJVGiWPl/wIOMHRR
 c5Fw==
X-Gm-Message-State: ALKqPwf5Z9EwUBlZk8K+tHY0zv+zRzGNYCmZjMjEoQ0AdJUsncRQGCJm
 dojdRa3pcOe/9wmcUUeN3LRTpw==
X-Google-Smtp-Source: ADUXVKJYd6zt3iNxc0fTtQXFw1cL+KWqHZuzemkOM/PczrG7vZXlk0cRydTfhrrIZi2qWMPnwkPRHA==
X-Received: by 2002:a62:dc1c:: with SMTP id
 t28-v6mr2440748pfg.137.1527772495690; 
 Thu, 31 May 2018 06:14:55 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id g207-v6sm68042540pfb.18.2018.05.31.06.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 May 2018 06:14:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 2/2] hwmon: npcm-pwm: add NPCM7xx PWM driver
To: kbuild test robot <lkp@intel.com>, Tomer Maimon <tmaimon77@gmail.com>
Cc: kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, avifishman70@gmail.com, yuenn@google.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
References: <1527588141-18639-3-git-send-email-tmaimon77@gmail.com>
 <201805311515.VL3llohd%fengguang.wu@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6843f9d0-55e6-725e-456b-533123c2d9c4@roeck-us.net>
Date: Thu, 31 May 2018 06:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <201805311515.VL3llohd%fengguang.wu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 13:15:00 -0000

On 05/31/2018 12:16 AM, kbuild test robot wrote:
> Hi Tomer,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on hwmon/hwmon-next]
> [also build test WARNING on v4.17-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Tomer-Maimon/dt-binding-hwmon-Add-NPCM7xx-PWM-documentation/20180531-034040
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: x86_64-allmodconfig
> compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> reproduce:
>          make ARCH=x86_64  allmodconfig
>          make ARCH=x86_64
> 
> All warnings (new ones prefixed by >>):
> 
> 
> vim +277 drivers/hwmon/npcm7xx-pwm.c
> 
>     250	
>     251	static int npcm7xx_pwm_probe(struct platform_device *pdev)
>     252	{
>     253		struct device *dev = &pdev->dev;
>     254		struct npcm7xx_pwm_data *data;
>     255		struct resource res[NPCM7XX_PWM_MAX_MODULES];
>     256		struct device *hwmon;
>     257		struct clk *clk;
>     258		int m, ch, res_cnt, ret;
>     259		u32 Prescale_val, output_freq;
>     260	
>     261		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>     262		if (!data)
>     263			return -ENOMEM;
>     264	
>     265		for (res_cnt = 0; res_cnt < NPCM7XX_PWM_MAX_MODULES  ; res_cnt++) {
>     266			ret = of_address_to_resource(dev->of_node, res_cnt,
>     267						     &res[res_cnt]);
>     268			if (ret) {
>     269				pr_err("PWM of_address_to_resource fail ret %d\n",
>     270				       ret);
>     271				return -EINVAL;
>     272			}
>     273	
>     274			data->pwm_base[res_cnt] =
>     275				devm_ioremap_resource(dev, &(res[res_cnt]));
>   > 276			pr_debug("pwm%d base is 0x%08X, res.start 0x%08X , size 0x%08X\n",
>   > 277				 res_cnt, (u32)data->pwm_base[res_cnt],
>     278				 res[res_cnt].start, resource_size(&(res[res_cnt])));
>     279

No idea what the tool is complaining about, but the messages should use dev_ functions.

>     280			if (!data->pwm_base[res_cnt]) {
>     281				pr_err("pwm probe failed: can't read pwm base address for resource %d.\n",
>     282				       res_cnt);
>     283				return -ENOMEM;
>     284			}
>     285	
>     286			mutex_init(&data->npcm7xx_pwm_lock[res_cnt]);
>     287		}
>     288	
>     289		clk = devm_clk_get(dev, NULL);
>     290		if (IS_ERR(clk))
>     291			return -ENODEV;
>     292	
>     293		data->clk_freq = clk_get_rate(clk);
>     294	
>     295		/* Adjust NPCM7xx PWMs output frequency to ~25Khz */
>     296		output_freq = data->clk_freq / PWN_CNT_DEFAULT;
>     297		Prescale_val = DIV_ROUND_CLOSEST(output_freq, PWM_OUTPUT_FREQ_25KHZ);
>     298	
>     299		/* If Prescale_val = 0, then the prescale output clock is stopped */
>     300		if (Prescale_val < MIN_PRESCALE1)
>     301			Prescale_val = MIN_PRESCALE1;
>     302		/*
>     303		 * Prescale_val need to decrement in one because in the PWM Prescale
>     304		 * register the Prescale value increment by one
>     305		 */
>     306		Prescale_val--;
>     307	
>     308		/* Setting PWM Prescale Register value register to both modules */
>     309		Prescale_val |= (Prescale_val << NPCM7XX_PWM_PRESCALE_SHIFT_CH01);
>     310	
>     311		for (m = 0; m < NPCM7XX_PWM_MAX_MODULES  ; m++) {
>     312			iowrite32(Prescale_val,
>     313				  data->pwm_base[m] + NPCM7XX_PWM_REG_PR);
>     314			iowrite32(NPCM7XX_PWM_PRESCALE2_DEFALUT,
>     315				  data->pwm_base[m] + NPCM7XX_PWM_REG_CSR);
>     316			iowrite32(NPCM7XX_PWM_CTRL_MODE_DEFALUT,
>     317				  data->pwm_base[m] + NPCM7XX_PWM_REG_CR);
>     318	
>     319			for (ch = 0; ch < NPCM7XX_PWM_MAX_CHN_NUM; ch++) {
>     320				iowrite32(NPCM7XX_PWM_COUNTER_DEFALUT_NUM,
>     321					  data->pwm_base[m] + NPCM7XX_PWM_REG_CNRx(ch));
>     322				iowrite32(NPCM7XX_PWM_COMPARATOR_DEFALUT_NUM,
>     323					  data->pwm_base[m] + NPCM7XX_PWM_REG_CMRx(ch));
>     324			}
>     325	
>     326			iowrite32(NPCM7XX_PWM_CTRL_MODE_DEFALUT |
>     327				  NPCM7XX_PWM_CTRL_EN_DEFALUT,
>     328				  data->pwm_base[m] + NPCM7XX_PWM_REG_CR);
>     329		}
>     330	
>     331		hwmon = devm_hwmon_device_register_with_info(dev, "npcm7xx_pwm", data,
>     332							     &npcm7xx_chip_info, NULL);
>     333	
>     334		if (IS_ERR(hwmon)) {
>     335			pr_err("PWM Driver failed - devm_hwmon_device_register_with_groups failed\n");
>     336			return PTR_ERR(hwmon);
>     337		}
>     338	
>     339		pr_info("NPCM7XX PWM Driver probed, PWM output Freq %dHz\n",
>     340			output_freq / ((Prescale_val & 0xf) + 1));
>     341	
>     342		return 0;
>     343	}
>     344	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
