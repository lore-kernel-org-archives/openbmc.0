Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="siLq9mwl"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SW7t5rbzzDqH5
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 21:43:21 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id i2so6250605pgj.11
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k9jFKob1IKGpqfBayIGkyKXP1cCCwU8821AjdRG5kRk=;
 b=siLq9mwlanWqCwefXWpGVe8ek5WD/DWLmvyScGR8Ln8QAWiEmeGZB1AgoEOBrqlrWk
 uSWmmrYCGx2XV559BwbH053E9JK7DnWcXBoKGAL9vvQt3mB5scLJNhev2WvifsyfcCo9
 kyzJOpMqys7u1jWnaVXFf3QL/vBxY3IwVv42Hrt8XLBi5lL87qFXNRQG/OP+R4KkPqRs
 S7mQJJvc6V6f+HS4fSpXcAkubShY8Nj1al4wezNnsPvfL9bRUG0Z2raD3G3qrcVjCpBj
 4CFH/PhYKRgaV/bAZ4h4I6dYZDX9MSialvl4hvS4hMw9ml+nPsyfZLmHQnCOgeMFQNeS
 5TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9jFKob1IKGpqfBayIGkyKXP1cCCwU8821AjdRG5kRk=;
 b=ZZ0aplHnwHJrCbTb/NCx5tmZE2CiXcjY9H9cET0Y0DiNmZFYj0ctx7BsaZBL5QNHi9
 CUIdX1dAl80K2AlrbOHoqWMJsgZK4c3+2Jg3CWb6Ioek4Cb1BYe7YC3MXDs5wCTMISR4
 SPOjESyY+KAeLCs2NPuNLZXf5bDGGgfXeYYIBMi5eoJkMX4Q8vlNLdcmsQOZzYrUn6Of
 bDTzAM2vpXgPQfO6KObHwTepvHi0DXN2gXCwSPQIptFGSiUc60WGWUU0YYa7qOEL0kpM
 EJpxq0BqEwpbhClFv4rR6np/ERCgCNiAJs+LEdP2ZUVrX68Cn+GHS67vA56sYav60vlo
 2ZZw==
X-Gm-Message-State: APjAAAXCfcB1adMFym9GD8cV9yLJ1rzInyOqpgridOfnu46eANCLvQQ+
 4aQdq7ZovXOklcu0jsBPxyQ=
X-Google-Smtp-Source: APXvYqyngIa1FLSQu1yE8WzHEB43BkmVKa3+F172YKc3f+9IKDirbovX35niS7Pv25xc0VSYa2EncQ==
X-Received: by 2002:a62:4602:: with SMTP id t2mr9601366pfa.26.1553510598871;
 Mon, 25 Mar 2019 03:43:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m25sm7309809pfa.175.2019.03.25.03.43.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 03:43:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Userspace matching of hwmon devices to hardware
To: Lei YU <mine260309@gmail.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.de>
References: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cd76447d-fa01-e3f7-fa2d-7695372e71e3@roeck-us.net>
Date: Mon, 25 Mar 2019 03:43:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2019 10:43:23 -0000

On 3/25/19 1:21 AM, Lei YU wrote:
> This email is to ask/discuss if there is a stable path/name (or whatever) for
> hwmon devices in the different versions of kernels.
> 
> In OpenBMC, the service phosphor-hwmon reads the sensors' value and expose to
> DBus, depending on a configure file that matches the device tree path.
> 
> The service is started by udev rule, called with the DEVPATH and OF_FULLNAME,
> so it knows where to find the configure file depending on DEVPATH or
> OF_FULLNAME.
> 
> E.g. on Romulus BMC, the w83773 sensor has OF_FULLNAME at
>     /ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c,
> and the service knows the config is matched from path
>     /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c.conf
> 
> However, the DEVPATH or OF_FULLNAME is not stable in different kernels:
> * In 4.1x kernel, the path is as above.
> * In 5.0 kernel, "i2c@1e78a000" is changed to "bus@1e78a000" in the path.
> 

This is due to a devicetree source change with commit 1426d40e11f73 ("ARM: dts:
aspeed: Fix I2C bus warnings"). In general you can not assume that devicetree
files (or path names derived from devicetree source files) stay the same across
kernel releases.

> This breaks the userspace's phosphor-hwmon.
> If we fix the issue by updating the configure files' path in userspace, it
> means the userspace only with the new 5.x kernel.
> 
> So the question here is, it there a stable way for userspace to match a hwmon
> device?
> 

libsensors should handle it for you, but I don't immediately know how to map
that into udev rules. Jean, any idea ?

Guenter
