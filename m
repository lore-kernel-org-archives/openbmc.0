Return-Path: <Steven.Hill@cavium.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cavium.com
 (client-ip=104.47.36.80; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=steven.hill@cavium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=CAVIUMNETWORKS.onmicrosoft.com
 header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="YCWTZuW2"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on0080.outbound.protection.outlook.com [104.47.36.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zh3pK1c9DzF1FB
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 13:51:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kddiPhc2L4ZGkzmg5TdtJqbEJsi/GHYME1coEyNVwuY=;
 b=YCWTZuW2o6SAsKgqbN7rILfp0QDUdnIF4Q3cHLaRwV0SlCxB9PLIuLR+0t59+BRv8mLTYEWQ0RXalSi8Z4Eo/HNPaXw2ap7wrCZsABkQJPzwN5zAOKSM54rGJYmK0/52/WMoNa1nsEZi8p8mJ7ymF2BAZm+0PwrGVTQA7wEwGxQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Steven.Hill@cavium.com; 
Received: from [10.0.0.40] (50.83.62.27) by
 MWHPR07MB3615.namprd07.prod.outlook.com (2603:10b6:301:64::28) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.485.10; Wed, 14
 Feb 2018 02:51:45 +0000
Subject: Re: udev faulting with openbmc filesystem builds.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
 <CACPK8XdWGur=QB5QK+mja33M0bRkXGg9gCoVn_DdJF4vKD+p9g@mail.gmail.com>
 <95cd4831-f9fb-0e72-9305-a249fc99c956@cavium.com>
 <CACPK8XdWo_G31R3QgLBmG+hWT77604vJrMgd4+ZHcK_N4Wi2Og@mail.gmail.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <89a207d2-8968-bdd1-100f-ed449e8b3441@cavium.com>
Date: Tue, 13 Feb 2018 20:51:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdWo_G31R3QgLBmG+hWT77604vJrMgd4+ZHcK_N4Wi2Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.83.62.27]
X-ClientProxiedBy: DM5PR06CA0106.namprd06.prod.outlook.com
 (2603:10b6:4:3a::47) To MWHPR07MB3615.namprd07.prod.outlook.com
 (2603:10b6:301:64::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12e34ba4-fcd9-4139-2d67-08d57355e2e9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
 SRVR:MWHPR07MB3615; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3615;
 3:V5YPDMxVxDLXGh5lTckp07zyE3hd/nki7ug0Hq7j2NK5Ezd7/nSN7xTnTZwwkqgQZnQ+g52PUt7BXt84aRiw/wYueozLLL5LSR8vw82DILDb8/UescOwe14XJoSoCf6XP6pnbMPhvWOt3MTg9WGZPMx+raKCsYwwPToeAPdZ3YvunCFCpnsoHLH8FkI7HPE9+KjKTMRZEs/jrRqwpfOh4BKsV6TAPOd1oJbEFzR0uLwHxmCL2PWyqGsbIGR8QeXp;
 25:StJIxsR879dk6hFVFum/aBMoC6+JrtBdnYX/ICcyxYR4+hriObm1+zteMlvijBbpa0tiyX/ZVi4wYTWoACvkWjCnmqq5ZllzWrA/EyU3feRDN6ZIjoIw4Rk3T6NKqKUuOcqogSpHUK1S2uIuuujD4DIkTmlwtRTYvz1HViY4dgwh74SSbRXA4ioyN8FJ3N38WBHrYDNCtFcD9h1xPDpBZ+nWBn1Tnk77Qvxjm+xhhnuhYXHZ3JDycCjhSKXpT6b+d22nYGnkHc6qNAi16fYYmZPjVOgdja3F9iJzzGb3tF2rov/LRf6sqLsVl+pGtIVJk3Z/oEsg1th4Hjos/WxecQ==;
 31:J8e/sY40uBgnAYd+AUUSNzsd84yfB94+9TpdH4/1m93SC0Tv2Ij5V0sz1AWR+1OXXQrkZ5mH5YZEaMwpJQs+ZsKLttDf0etA9hMDZgqPIUXC8wWSPr0bUCfwDZPhDeZ/x3wwza8393uPWi55kpaSomFAZbPhUh/CA2tlKoGeF4N/ssL+NW9w82YtcVvKzcfQtltDQXjINBZpqQifmu3hhzJMDzaMm/q5IDwOEmFWl94=
X-MS-TrafficTypeDiagnostic: MWHPR07MB3615:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3615;
 20:Csj51D7jCZz6dTXKXoa004akxYGqIVsI3wY6DBtYDiAahB2r2L2hQzlrf3o/T7tN9q1SZC85j0OfrChkJ3aCoeCi7FtF3RUGRteougZEPjjlK5eVUjmSkrWdqBHIiq5DmusXswN9WyfbCkl9LtZexbPT7YvDIJCClrQyZKvj2gHqpl/Ekz4m3oq9qx/zABT3IDm30es9xjXW6/3dKhiTBeH2oXkgWwptkjNSv16LYq+8eqZWYsm5dWl8asF4RY+0iJ49lolUtu7VeXbHG9+4/NMRXOepTS9RoAAfr3Ci/hDSqb6+XhcDGd8gZnzNP1GoBkNyRu+cQh8512YHzKUMCpfHJRY9Lh47v8FxTpRd5XBqfG0JjSC1sVI3bQXci/p7GVcsMLOSpH1lastpV49SbacDrDwI1yNqm6is3OuUk3iwsnLHjOJgJDBm9kA9eGhTYHHzArIz0H0UCut4g6ig2NfldXk9aRS9rSv6BljIL9yA+hehA7GAHzcMq2WStesf;
 4:B9KROH+C2eNTXkflaMbeRJ3jPsbBU6pki9VBh/t0ZC7gnGBwls8KmjdL1D5LEDe+C9kuphBjgHXX+uNDfwC9Mq1T+xaKXdC6gH+tP3SHwaC66/9ZXSfCMYM3a98grfOyBICsYymlJeXrSVTyHGeg6msqQzIKueJjrkcdkukJZagi3uJOTOzGURTUi1/oNPjtfWLUNtA6d+MkspbH2ednp9Am+9cHrOWcBXpk4QLU/zH9GI3hVQNn2TGwa0SyjOsvydMTjXGhPpaf8dhaF11Mfg==
X-Microsoft-Antispam-PRVS: <MWHPR07MB361534552EEC3F96EEB1B60880F50@MWHPR07MB3615.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231101)(2400082)(944501161)(6041288)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:MWHPR07MB3615; BCL:0; PCL:0; RULEID:; SRVR:MWHPR07MB3615; 
X-Forefront-PRVS: 0583A86C08
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(6049001)(366004)(396003)(346002)(39860400002)(39380400002)(376002)(189003)(199004)(2906002)(478600001)(81166006)(8676002)(65826007)(72206003)(83506002)(81156014)(229853002)(8936002)(53936002)(6246003)(86362001)(93886005)(106356001)(3846002)(2950100002)(6116002)(26005)(65956001)(16526019)(66066001)(76176011)(105586002)(65806001)(47776003)(50466002)(97736004)(53546011)(386003)(6916009)(77096007)(5660300001)(230700001)(6486002)(31686004)(23676004)(31696002)(2486003)(52146003)(52116002)(316002)(58126008)(64126003)(7736002)(4326008)(68736007)(305945005)(16576012)(25786009)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3615; H:[10.0.0.40]; FPR:; SPF:None;
 PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA3TUIzNjE1OzIzOkZwRlVXZERlMHFuNzRBaVVsZi9CMkhmNXUv?=
 =?utf-8?B?NStKZmY1NmtKeFVaR0NvdC9OdERzVXBpYjFKK3JGcExGRTRlc0ZMMlprWjhM?=
 =?utf-8?B?OXZtT3dkOU9iWGZSSzlLbVVuQktDV25tcFV1c2JJamRsZWdMN1NxcnlVQ3N2?=
 =?utf-8?B?V0lnN2dBYlVjMTVLSEV3S0xjQ3hXTWNhd1pRbWVJaU02Q2RoaFRPTHJ5MHJD?=
 =?utf-8?B?ci9tZnhYSjRWSnFSZDhFTm9TUzFxSmg0R1hSd3FIeC90YzlNOERwK1AzTmIy?=
 =?utf-8?B?NVFjWEpmQTJuQVZ6WWtjYmdJQTg2aU5NYjRiV1JMVlhCWUVxVndXZHB5M2tx?=
 =?utf-8?B?YXl4WW55Ly9qWG1nYmc2aUxwWVo3RUJuS3h1N2lhNkh4TXp5K3VneXd1UUZl?=
 =?utf-8?B?Zno5MXI0RWtST2s4YmxFT2d3cUdUUkRXTlJDVkgyZ1diTng4VWpzZzJpTEhB?=
 =?utf-8?B?dEM4UksyZHRqUGtSR2FOR01SK3RydU05Z01OQmdDQUNWVXp0MSsrOS9wbUw1?=
 =?utf-8?B?TzdXclNCRFBMenNhV1VWSmtUZlJnOCtqbEVZUjVVL1loemFHQ21DY3JqV3o4?=
 =?utf-8?B?bjVtM05BNVZzVnRsM1QzOVRhWS9yUThxWm9UNzdhRXliblhSaGtDYzBKYWZX?=
 =?utf-8?B?Z0ZRcGxWQkgrOEtpaWpEWEVBdHYwa0JYZ1diOExTUGpqTXFpNTNPTFV5ekt5?=
 =?utf-8?B?SUxFS01nR3R6ZkRBTzZqaFpRSkQ2ancvV3BxTzZET1hGaEU3NjlRaThkS2g2?=
 =?utf-8?B?ZTZZcnhOalhwcmRYMHdGQ00rbzdSNUVJQnZyeitYd1o4alFIM2MzRkNSWnpv?=
 =?utf-8?B?U0ppMHhzckJKUE9heVRUSXVFeEZ5cjhEaFhZZVgyMXN5WFppU0hld1RzemxJ?=
 =?utf-8?B?MG5NUDlDT1FkSzYzR0pzaTRGUjhqWFRyTXRyU21UQ0YyOFVtMnFFRnQrWXgz?=
 =?utf-8?B?MEhGQ2tnSzl1RmNmSWxCaEZ3cncrOXVwSVFTUlRCaUNIMXRsQkZ0OG1yRnZ4?=
 =?utf-8?B?aXNwVmJ6YTE2VDY3Lzl2dC9OeFowWm82d0NRTmJ2QlNHQkRxU0gxMmI3Q1ho?=
 =?utf-8?B?Rm9xbk1ETE9QMTJLUFZ5Q0NmNEhJOGwvcW5NYUU5cGhQK2NhMEdOeXVaZ2lS?=
 =?utf-8?B?VDZRRS91bGF5R3V4bE5vN1F6TTVXeWErTkVlTFlHYnN3NldBeEhacktLYW5h?=
 =?utf-8?B?c0VDTnRqMm1zL1VZRW9DMVRmMEFmVzdXQk5GaURURllZb0hNTjdMeVhmMjFO?=
 =?utf-8?B?UTltT1I4dkh0c2k1YkxmUHJsb2NjSWhFZnlaZ0hmNlBTY1ZaWGlrdm1nQXYr?=
 =?utf-8?B?OTRXQ2ErbnM0TEtLeU1GMGh4R3VGdHMyWVZWSWE2aXRWRHJ2OWJ0NXp1TXZr?=
 =?utf-8?B?NDFJekNVVW81U2VxaitZc0hjOHFWcnU1THB1WXBLa2doQ3ZLZUdBL1hlSzd4?=
 =?utf-8?B?ZjMrRlFqOFRRRHFHOGFpL3o3UituMWFwd1R4Vmo3WUZpOVMrd29rZWh2SGFw?=
 =?utf-8?B?Zit3MTg4bk9HS0h6RkpQMHY3VmVtblJOcXdCQXRBVHhEM1huZTlZZjc0R0tu?=
 =?utf-8?B?VHRHV3F1YldMM1ozUU80TCtPSER3VTVaMEQ3NkwxN2FORmJHeEtDZGM2aEpC?=
 =?utf-8?B?ejN6QlkwT3lqODdWbmE1QlVyNFB1R0NCZ2JpNlFRaEpPdTZCa0NTb0luSG0z?=
 =?utf-8?B?VVdiMlZmMHRTWU5jT20wN3pROEFZbG00RmR5aXA5TWRwS2lWaXBiQVNBRE55?=
 =?utf-8?B?K04vbVEzTUF5Ly82Q0VVei9uL1Y4MTJGRXRnRmRzaVc3d056NTNVOFFtcmgx?=
 =?utf-8?B?U0xVaTlJZ3pxN1JnMDVJWTBEV3FVSUtDais1bkdnbnlCVHc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3615;
 6:8srdVoXZx/v+Vn/T1ZQONQSeuH7wcxY6EjrEeqnk+Q6iOiaaT82kG7YR0aGX7/bZoVgTGt7NrZeogxOkzhD6hlfCP3dm4Vgp77AhborKjtjz/+8ikFPx/t3gwDdRFF16ydnkU8gfgN093rEmJp57kOTLTZGOFnK3exmmJob9xGe+2lJKWz6ljdqY/e/4vc6LSl+UierDNWA+vdXXWRw7En6kalWNQpBrpTyvEmj5jWnB6rWnw4RNvMdJG9SGDYBlhvjC/iwufndrzsKVxng0kVB1qzsLEDPeW47hibI4p3JABbA38rKfGV47D4achT8xL4kDFoBSshiG9fhgzgglasMpezE/r83I3lAWRzpwHfI=;
 5:DEmnfNn/4dNU4NGeBuMZk3l+AjdOFsp6anLQFBK4EzG1tSJ6FvPX+Zfxifz9H4YMORlEVWD+c98IUor4EuTPoafmtKOQlRRPyLhBGH3kX0oO3xr+f8kC0wMDW7QLYhRyYVxkd5LT9GwmAzmuYX6OPS/b/HoYcuAfA0tZeMkTOow=;
 24:l7h5tHympEEeHxp1x/TVLYqBxVW3cf4/7QShR2BzILoyMYPnxUJAQo49AcfaRrmfmTmQKJ462a9KF481Wl/nyxgPqd9yH3beHikOqzfXaxI=;
 7:9Wa365LVs5k51fCrJZtjJR7LCPWu1oB5g2uQFwkPw8OgAbrh7qPliolI8Ds9H6VcYZlOFkx7mWhrxrxjLEMlEiK5o4p99zKVIZkHk6/rWu7pwus0dgUy+cU7CxZF5n52K/RL0emsMJLowsjymBZi+koNfrNtYI9MJ3JGkveYiKk3lR0uNmD4n0u9Fe2XTUMEadOsZmoeZPPQ/Gy1g09NI25WMagcCBSn3jrcEhNlvdx7cqFYQg8q2/rpKxHnsujN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2018 02:51:45.3983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e34ba4-fcd9-4139-2d67-08d57355e2e9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3615
X-Mailman-Approved-At: Wed, 14 Feb 2018 14:22:03 +1100
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
X-List-Received-Date: Wed, 14 Feb 2018 02:51:54 -0000

On 02/12/2018 07:51 PM, Joel Stanley wrote:
> 
> I suggest you use the device tree for the ast2500-evb. Here's how I
> would build a kernel for testing:
> 
> git checkout dev-4.13
> make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm aspeed_g5_defconfig
> make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm
>Cool, this worked. I took the entire RFS from 'witherspoon' and made
a ramdisk and there is no fault with udevadm. It boots up completely
and I finally get a serial console. The diff between v4.13.16 and
the 'dev-4.13' tree is only 20K lines. I can easily dig through and
see what I have wrong in my kernel. Thank you so much for the help.

Steve
