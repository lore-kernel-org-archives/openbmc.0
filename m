Return-Path: <Steven.Hill@cavium.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cavium.com
 (client-ip=104.47.37.51; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=steven.hill@cavium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=CAVIUMNETWORKS.onmicrosoft.com
 header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="iQS0ebgW"; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0051.outbound.protection.outlook.com [104.47.37.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd5kK49YHzF1C5
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 18:08:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GVpT8axENNrvAO/lIQ/B+VbpDHdmzYFZdv+mHPTg98U=;
 b=iQS0ebgWJ/i5A+GITTxJ8rrMYqRCoWSg3IVsZCYoHTj7L77DazzqdgM3HbFJJUKovjWF/ACGGsJ5KiJFkuO38QfcEv0OIDmkMd6Sx+Wnx4hLMNsRU+nuIPrGGWE3qGMj4Zyafqt7ffaTqK/oC7yrNxpWP9K/56o/25c/eI4ZgIE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Steven.Hill@cavium.com; 
Received: from [10.0.0.40] (50.83.62.27) by
 MWHPR07MB3614.namprd07.prod.outlook.com (10.164.192.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.464.11; Fri, 9 Feb 2018 07:08:02 +0000
To: openbmc@lists.ozlabs.org
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Subject: udev faulting with openbmc filesystem builds.
Message-ID: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
Date: Fri, 9 Feb 2018 01:08:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.83.62.27]
X-ClientProxiedBy: DM5PR21CA0030.namprd21.prod.outlook.com (10.172.92.144) To
 MWHPR07MB3614.namprd07.prod.outlook.com (10.164.192.155)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27be8ac3-bdd3-45a6-20a4-08d56f8bdc35
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
 SRVR:MWHPR07MB3614; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3614;
 3:Yq+aPyeFp8WL0gPE1xvafTCuJ174OWGa5MwL10Ot68QueUEGDjID76JTUzKQ7dIjxGQMmkjCjIr2lU/F1NWB7oz8TIL+SqSqjeS8UjtklkuVNG2gELGSSfwqP6WseMhuei3yCejr23lnHdP/7ZI6gUWLS68glIAVavcFT/FXLgoqlhsQ0zubjbA8PO6h56MQEFbfuguwXePSI0J0li0cnflruIKwB0NsrLUtNB/4NGKq5m1vzphE0HUF3QyyV/Oe;
 25:Yoxt6cLZ3fF7N4bhX2wMSGv9Zy7mYxfwUf+fe4N8FkOnMSctLCmkiEH8J+XtlfLhecHIHzvQvRDuwTGPV1eiyvCpjgTQJiqX2TKIrn9d3Q7GuHMQBcONCoVczJdVz/eC8j3w+2k9vVW8lk9SX++wsCf0kj7p4UpfzOewHTCCDkymE8jhgk66z40sc3Pdq+UD2tmaCU26ntfnjXLKzFLBuhroOKMJ5ta5q+ipuNSEUtbCwebix03C/azJlnyVPNUHEhR0yy2F+GTy+odYJIPUvlL+vCer0BVCyJRb4JycOPMtE0326xJrVPayG/d/cDXm6PTk2lIEAxEPSf+OvFHN2w==;
 31:AovP/t4cUsZt28+JDDLIIFmLdGrmgPeaYDmeS4GppHqUzS27iVelnBdATrYQoF8tqJN+H7X0DWU9eN/zEy/VeoyQYrf303Avpf2kyOd8DkijRcs8HxxD+X+erDSu6r+baeNBVI76aIBj3cTs38WjbmBKO5zmejCA/YK+xtpEpR3ppAHaTcBm/5FtFoXQ4m0McWO+JScFaPI0V+Wt67PaXEEyM4ahyPOKtBM/+XMDH2Q=
X-MS-TrafficTypeDiagnostic: MWHPR07MB3614:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3614;
 20:x/Wv+t/xHUdjrF/uhRtmBQniDeOHnzdY+09RrLha9x3STPHwHfClf6Mx9/paJqnpzI9Yy3XDWso6f7tMf9RiKqk+luFmJBZ7FLtRsMz+vaUQAMtMNYqjONiSCeQ7EcWiJgYToJjMEnQu0MQ8sHVFEVgF8QSLEL9DTWy2c3eES9F0FrFQGNgxl67O8VmZP+4bdqZYUCL3nmdmW8aGMJZ8uVhtDMMj3qJaMJnBvpVcv0A0q4jwRc4pcdYXiHw0ERhhVWos5Q6YUIaLtOwbdv1r2HDn995siKfF0N+Wi0D0Sn3KjrA/yJaRreyfDpPyFiFx8cLLD7diyLCUhh1oqCmiStHsfwrEEWAii79dKT/sTmAYjsvL2tix/GU2CakfPH9G/pdfzblVKeRSSagCfHGdsOZkNxDFCW8zQ+E+f5X2obOWbyAbfg75je9nGHymqiGJy1sZOFXOmMFLlAsX0lCs3Ryw2XQUja5r4xQMTbC6Di4Us4SvFqiqm+VBhGi4Yr5u;
 4:pJnTAmfR0cMWj8t1gGHeBGBl/mg1cCUeNh3RZmNoQBKkDNoH7bIg8TWVOM62vj6/9GpaVdc2azovrkGZJ/lhXTAjugQGaC3f/I6s09Z4CX75blJCvkMtPMlRIurtTQozrnSGXBGOfxZ5kESiDORNaqC3c23atpt55EsNTNAKCy8zjgdrui+6X2bZtPfFyJzwfqEBOZ2qP4R3lTayrj7m4pqgLF1SC9uAiL2CkN+lKCfSUEg6hKZbpjaQejufn11mW6DyL/oJ5oq7o2Gfb6Owsw==
X-Microsoft-Antispam-PRVS: <MWHPR07MB3614AD9B8AC0580ECCD1AD9080F20@MWHPR07MB3614.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231101)(2400082)(944501161)(10201501046)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
 SRVR:MWHPR07MB3614; BCL:0; PCL:0; RULEID:; SRVR:MWHPR07MB3614; 
X-Forefront-PRVS: 057859F9C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(6049001)(39380400002)(346002)(396003)(366004)(376002)(39860400002)(199004)(189003)(2351001)(106356001)(5660300001)(50466002)(8936002)(26005)(65826007)(2906002)(186003)(31696002)(72206003)(3846002)(2361001)(58126008)(83506002)(25786009)(16576012)(47776003)(52116002)(65956001)(31686004)(52146003)(305945005)(105586002)(66066001)(65806001)(7736002)(575784001)(316002)(6486002)(386003)(59450400001)(6116002)(16526019)(97736004)(86362001)(2486003)(478600001)(45080400002)(6916009)(230700001)(53936002)(23676004)(81166006)(77096007)(8676002)(81156014)(68736007)(90366009)(64126003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3614; H:[10.0.0.40]; FPR:; SPF:None;
 PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA3TUIzNjE0OzIzOnJmYzZmM1locEhJVlUxRXh3L2dXbGVYTXY4?=
 =?utf-8?B?S2ExUTVwc3o5KzJyOVk4cHVTTTVFLzQ5RS9XTFBQS2k2UTY1NDRwM1krMkQ2?=
 =?utf-8?B?VkZvTjgvWXlQQU1IYmdqaXNzRTZFUnZhbVdhUHFmY3NDdHdWcjVGTjFYd2ZP?=
 =?utf-8?B?UlpVQTNTK1g1bXVZa1U1SnVaTXpHQmJxK3VpQUtMeEkyQU52b2dIZjl5SkxI?=
 =?utf-8?B?emN0RUxKZVB6T3NIbmFDT2ZPckIyVHJTOEdzb0RBbll5WmRudEJIR1hCUmVM?=
 =?utf-8?B?anpTRmRFbXR2WkRZd29ReHlHSnpDV0F0bzJXUjZ2M2FxSFBzSnpUVWRLNEha?=
 =?utf-8?B?bmJsY3dwMVhzSlZWTEpTZzVwVTBPSjlTVlRhVVBqanZrZkExb203eldETTZi?=
 =?utf-8?B?TjRkeVhmNzV6MjlsT21NdjBPZGkrM0tGRWxGdkxCQ00vZUFJUlRrTTdJWlRZ?=
 =?utf-8?B?VjFaNXRaY0JoWDFuaEVxa3lJaDViNHJZbmJQZWhKcDdoWEtPd0QySG8yTTlo?=
 =?utf-8?B?YjFuTzU1MWdPdk9PbWFYSVFtTG1FQmhBMjFLYjJ2QlFCU2FIZWJRN3RSZ2I3?=
 =?utf-8?B?VGg3dTRhRU0rQ0xhQzVXK1Q2RnVpbEM3SzVHWTlkMTVUeVNqZFZZcWVuWVVV?=
 =?utf-8?B?OTF5cDM3a0Y0blMwK3E5ZHc3Rm5wb090M3NNSDV1K2YxbXBDSEN0eGYvMTdz?=
 =?utf-8?B?NmZiMmROeEJwVHp5bXFGVjJBcGxUUWNaVStmdHVKRmprVDZ2UGpZVWk2MHFt?=
 =?utf-8?B?UEk2ME9oaGQxTyt3dm5CSm9aZFgrZWJ6b1c1K2lJc29iMmJ4dFRQdWZWcGdn?=
 =?utf-8?B?bDhyYWorQ0FtZ3ZudHJjRm16RUU2UnRsUTN0SHFGVFA3Q244dFVvZXIxTzVY?=
 =?utf-8?B?bXJocGtNMUtQYW0veXFsY0Zxd0hXSlBadkx3alJlS3BsNkx2dEZNc2ZMb2hF?=
 =?utf-8?B?OHhTOEdMT1llaEp5U3dyYnFxYVRJNDkzZTI3TWxYSXE3alNkaHFTNXdEOTdO?=
 =?utf-8?B?T0RSVDZRUGQwUnlZenkvaHRGMzJ2d0R2OVBPYXJnU0M2WVU4dXBoY0tvWnFV?=
 =?utf-8?B?T1N2QmNPZmhIWHlZRjRBUUorMVpCQSt3UzIvcVF0cWNPNmJDcjZBRWxseE9t?=
 =?utf-8?B?Ny91SmhBdncrN3ZtMXJOeWVWdWRuUnVEN3BIRTZGOXNPUkROUGcxTlR6aWpm?=
 =?utf-8?B?V0dkN0lEZWhYTmNUdDNLWU1udXBLd2QyMHoyZmg3OENEdWdVTVR1WXNHVmNW?=
 =?utf-8?B?Mm1kWERWV1o2RFIxVi9nTkpoSythSWJjSnVKNStZelpxWVZoaGtZTFdSU25N?=
 =?utf-8?B?UmpyZC9zZTRKWkhWODNiQUlBclNYZitEbGdWc2pSeURpKzJKZFMra2JEUkFS?=
 =?utf-8?B?RlFFZkh3K0hUM0lnWklvNnJxMS9aeTJERHc2eUtML0hNUmRDS0QraVdaa2VQ?=
 =?utf-8?B?QnAxdkZXNERMU0puamdvci9WZXVQNG1jNSt3MDRjTHF2NXJIMjYrVFZlMkdR?=
 =?utf-8?B?OXdOVHQ5aXFYNzcwUUVLOW9qTmRwcmtKZjRRdE5tVHVVZHcxQmVuQUFEVHo5?=
 =?utf-8?B?eGpzQ21FSUw1WWYveERkVzZCVWgyNnpjUnhIdU5CSktJTDAvVTdhcHdiaW4w?=
 =?utf-8?B?VkJFL3ArU0tkckNNK0xkWUl6VnN1cFgvUWgwWDBscmsyMUhHQ1h4VmQvTUpU?=
 =?utf-8?B?dVVZZVZXUnJQY2dyUjJzcUFHeDg4U3hRVFp0YnNiWUthOXhmMFhRcGRSbVZV?=
 =?utf-8?B?NDREanMrUC8zbDB2VkVoYzkvS0ttOWZkOVplOVNMUE5KUzYranJVL3hyc0M2?=
 =?utf-8?B?SnhTdUpqRElZdHUzS3VMc3ZhY1Zqd2lROWd1c2I0N2dZMnQ2ZnJuSE9QaXpj?=
 =?utf-8?Q?qHW8Hic4veM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB3614;
 6:3uTMzfNIGT3D8hRG1EhfanGikPrGiF3tytJenfoFvCj9MI4yrTefXnAEJlkSl/ux0bAnLeVnNjaIPtLAWPYpLap5irnwjhs8dOdyL4AWkSR9fYp/Lsokxuav66vwQ688K6xS58vZ54ZcFIQ0KE4lj+uartlIDT11ZSGb4f9Tt4H/z3m1lfS9WBOqQHKxIvzoifqLAKoa4Kil2CVRyUcESOowhHBbmApPDj0lYGriq0ZvIHRU9YwF09r3mQRuJz0bVo4u1s7fru5KfxDwxgxJRBVdSaftm8c8Ui1DQ+zuk8gHKYA4rSWrPh+MY+4gdH8/z1iZUCrWS0Qr/0EQhYjNjhLTXzTnu0AYHQL0hrB3OPI=;
 5:O+f8FtN59kcz5eTUtTdqIncCax5zb4CHTJvFa5Nfaa4oIadlnRkflRrs8oQHDlpnzjMDNkjNFdTNQSSVVA44LxzAugrv4K/w86MNH74jDyahnD/ZHyZQksp/j+B/NcZL8+ekfEk0CwWxyuoTkuPNt92wioAdxjkcmaOE5p4fhrM=;
 24:MkReY/NCKdq5QXabsuTLz54pZFy40EQVcxeW4ZrL2dbRT9LUeBM+E45uBzL6EfOIuPkeM8A3TNH/LYlRDZiL9syVog8izam3oJKptOgbYHc=;
 7:Vqh0GK4UnatnELszhP1BPXYv+M5ulbh18BQllfB619O9/wEPN8AqEW2TBt6JCITqR+17x+i5598A47hv1VkzI+izQRQQrrkTuW2bNFauSAsNbIQV9hO4pNNibOmzfBmMOsCE5dpelV3GFxTK2WLSZHHoFo25QSqVN1nr8Y5WH/5zgb1w/lVxHu2fOYE/VaiL+Fjq3D5/+GEqRIrkxjmuZLGo8wyJRKNw8/bSg5xW3CsPfxaB/28gkuUjDW8kMj1p
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2018 07:08:02.5274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27be8ac3-bdd3-45a6-20a4-08d56f8bdc35
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3614
X-Mailman-Approved-At: Mon, 12 Feb 2018 09:06:27 +1100
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
X-List-Received-Date: Fri, 09 Feb 2018 07:08:10 -0000

Hello.

I'm working with an AST2500 development board. I have built the
Palmetto and Witherspoon platforms. I am taking the filesystem
'obmc-phosphor-image-PLATFORM-20180208xxxxxx.rootfs.squashfs-xz'
and placing the files on a USB flash drive. Coldplugging devices
with 'udev' always faults as shown below. I have a custom 4.10
kernel that works with non-OBMC root filesystems just fine. Does
anyone have some ideas? Please reply to me directly as multiple
attempts to subscribe to this list have failed. Cheers.

Steve


[  OK  ] Started Apply Kernel Variables.
         Starting Create System Users...
Unable to handle kernel paging request at virtual address 9bda7000
pgd = db1ac000
[9bda7000] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 PID: 146 Comm: udevadm Not tainted 4.10.0+ #3
Hardware name: ASpeed BMC SoC
task: db025ac0 task.stack: db170000
PC is at strlen+0xc/0x38
LR is at kstrdup+0x20/0x58
pc : [<c01f2bb4>]    lr : [<c00965ec>]    psr: a0000013
sp : db171d30  ip : db171d40  fp : db171d3c
r10: dbff85c0  r9 : dbd9c208  r8 : 00000fff
r7 : db171d9a  r6 : 9bda7000  r5 : c0266bc4  r4 : 014000c0
r3 : dbd95890  r2 : 0000f000  r1 : 014000c0  r0 : 9bda7000
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 00c5387d  Table: 9b1ac008  DAC: 00000055
Process udevadm (pid: 146, stack limit = 0xdb170188)
Stack: (0xdb171d30 to 0xdb172000)
1d20:                                     db171d5c db171d40 c00965ec c01f2bb4
1d40: dbd9c208 db171d9c dbd9c200 db171d9a db171d6c db171d60 c0266bc4 c00965d8
1d60: db171d8c db171d70 c026b5d8 c0266b98 dbd9c208 db058000 dbd9c200 db171da4
1d80: db171dc4 db171d90 c026b778 c026b56c db171d9c db171da0 f000432c 00000000
1da0: 00000000 00000000 dbc26d00 db058000 dbd9c208 db057000 db171dec db171dc8
1dc0: c0268f20 c026b648 dbff3f20 c059b8c8 c04324ac db057000 00000fff dbd9c208
1de0: db171e04 db171df0 c0268d40 c0268e78 dbff3f20 00001000 db171e34 db171e08
1e00: c011c7bc c0268d28 c011c72c dbff3f20 00001000 db171e60 00000000 dbd3f680
1e20: db171f78 00000001 db171e44 db171e38 c011b2c4 c011c738 db171e9c db171e48
1e40: c00e0a08 c011b2a4 db171ebc 7f6ad9a0 00001000 dbff3f50 db00f5d0 dbfe7580
1e60: 00000000 00000000 00000055 014000c0 0007f6af dbff85c0 00001000 db171f78
1e80: db171f78 00000000 00001000 00000000 db171edc db171ea0 c011bfa8 c00e0958
1ea0: 00000817 7f6af9ac 00000055 7f6ad9a0 db171efc c011be6c dbd3f680 db171f78
1ec0: db171f78 00000000 00001000 00000000 db171f44 db171ee0 c00bdb0c c011be78
1ee0: 7f6af9ac db171fb0 b6e69b94 00000001 db171fac db171f00 c0009244 c0015560
1f00: dbfe7590 00000000 7f6d0000 db055ba0 db171f7c db171f20 c00a85f8 c00a6b04
1f20: 00001000 dbd3f680 00001000 dbd3f680 7f6ad9a0 db171f78 db171f74 db171f48
1f40: c00bf12c c00bdae8 7f6d0000 7f6af000 db171f74 dbd3f680 dbd3f680 00000000
1f60: 00000000 7f6ad9a0 db171fa4 db171f78 c00bffec c00bf0ac 00000000 00000000
1f80: 7f6ad838 b6d95c84 00001000 00000003 c000f784 db170000 00000000 db171fa8
1fa0: c000f5e0 c00bffb4 7f6ad838 b6d95c84 00000005 7f6ad9a0 00001000 00000040
1fc0: 7f6ad838 b6d95c84 00001000 00000003 ffffffff ffffffff 7f6ad9a0 b6e67ba8
1fe0: 00000000 beb0251c b6d95924 b6dee64c 60000010 00000005 00000000 00000000
Backtrace:
[<c01f2ba8>] (strlen) from [<c00965ec>] (kstrdup+0x20/0x58)
[<c00965cc>] (kstrdup) from [<c0266bc4>] (misc_devnode+0x38/0x40)
 r7:db171d9a r6:dbd9c200 r5:db171d9c r4:dbd9c208
[<c0266b8c>] (misc_devnode) from [<c026b5d8>] (device_get_devnode+0x78/0xdc)
[<c026b560>] (device_get_devnode) from [<c026b778>] (dev_uevent+0x13c/0x1e0)
 r7:db171da4 r6:dbd9c200 r5:db058000 r4:dbd9c208
[<c026b63c>] (dev_uevent) from [<c0268f20>] (uevent_show+0xb4/0x118)
 r7:db057000 r6:dbd9c208 r5:db058000 r4:dbc26d00
[<c0268e6c>] (uevent_show) from [<c0268d40>] (dev_attr_show+0x24/0x50)
 r9:dbd9c208 r8:00000fff r7:db057000 r6:c04324ac r5:c059b8c8 r4:dbff3f20
[<c0268d1c>] (dev_attr_show) from [<c011c7bc>] (sysfs_kf_seq_show+0x90/0xfc)
 r5:00001000 r4:dbff3f20
[<c011c72c>] (sysfs_kf_seq_show) from [<c011b2c4>] (kernfs_seq_show+0x2c/0x30)
 r10:00000001 r9:db171f78 r8:dbd3f680 r7:00000000 r6:db171e60 r5:00001000
 r4:dbff3f20 r3:c011c72c
[<c011b298>] (kernfs_seq_show) from [<c00e0a08>] (seq_read+0xbc/0x4c0)
[<c00e094c>] (seq_read) from [<c011bfa8>] (kernfs_fop_read+0x13c/0x1b8)
 r10:00000000 r9:00001000 r8:00000000 r7:db171f78 r6:db171f78 r5:00001000
 r4:dbff85c0
[<c011be6c>] (kernfs_fop_read) from [<c00bdb0c>] (__vfs_read+0x30/0x114)
 r10:00000000 r9:00001000 r8:00000000 r7:db171f78 r6:db171f78 r5:dbd3f680
 r4:c011be6c
[<c00bdadc>] (__vfs_read) from [<c00bf12c>] (vfs_read+0x8c/0x114)
 r7:db171f78 r6:7f6ad9a0 r5:dbd3f680 r4:00001000
[<c00bf0a0>] (vfs_read) from [<c00bffec>] (SyS_read+0x44/0x98)
 r8:7f6ad9a0 r7:00000000 r6:00000000 r5:dbd3f680 r4:dbd3f680
[<c00bffa8>] (SyS_read) from [<c000f5e0>] (ret_fast_syscall+0x0/0x34)
 r9:db170000 r8:c000f784 r7:00000003 r6:00001000 r5:b6d95c84 r4:7f6ad838
Code: c0412150 e1a0c00d e92dd800 e24cb004 (e5d03000)
---[ end trace 79534d21c87b0cbe ]---
[FAILED] Failed to start udev Coldplug all Devices.
See 'systemctl status systemd-udev-trigger.service' for details.
[  OK  ] Started Create System Users.
