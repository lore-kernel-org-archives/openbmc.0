Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fZQk5B8czF14j;
 Tue, 31 Jul 2018 08:45:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2018 15:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,424,1526367600"; d="scan'208";a="60745769"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga007.jf.intel.com with ESMTP; 30 Jul 2018 15:45:08 -0700
Subject: Re: [PATCH v7 11/12] hwmon: Add PECI dimmtemp driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, darrick.wong@oracle.com,
 sandeen@redhat.com, Arnd Bergmann <arnd@arndb.de>, Wu Hao
 <hao.wu@intel.com>, kusumi.tomohiro@gmail.com, bryantly@linux.vnet.ibm.com,
 fbarrat@linux.vnet.ibm.com, David Miller <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>, david.kershner@unisys.com,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, jgross@suse.com,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Alan Cox
 <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Stef van Os <stef.van.os@prodrive-technologies.com>
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-12-jae.hyun.yoo@linux.intel.com>
 <CAL_JsqK4k=c6k-BJT5fWQH_DCqGhr13fq6M_iZZehaveE-z5Hg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f3056c4d-1cc6-5fcd-f185-f6b0878e6326@linux.intel.com>
Date: Mon, 30 Jul 2018 15:45:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK4k=c6k-BJT5fWQH_DCqGhr13fq6M_iZZehaveE-z5Hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:13 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 22:45:19 -0000

Hi Rob,

On 7/30/2018 3:06 PM, Rob Herring wrote:
> On Mon, Jul 23, 2018 at 3:49 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit adds PECI dimmtemp hwmon driver.
>>
> 
>> +#if IS_ENABLED(CONFIG_OF)
>> +static const struct of_device_id peci_dimmtemp_of_table[] = {
>> +       { .compatible = "intel,peci-dimmtemp" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, peci_dimmtemp_of_table);
>> +#endif
> 
> This should be removed. Same for cpu temp driver I'm guessing.
> 

Yes, you are right. This isn't needed anymore because MFD driver
loads this module. I'll remove this code from here and from cpu temp
driver. Also, I'll remove 'of_compatible' setting of 'struct mfd_cell
peci_functions' in intel-peci-client.c code.

Thanks a lot for your pointing it out!

Jae

> Rob
> 
