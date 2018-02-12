Return-Path: <Steven.Hill@cavium.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cavium.com
 (client-ip=104.47.36.41; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=steven.hill@cavium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=CAVIUMNETWORKS.onmicrosoft.com
 header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="ZkAM64FT"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on0041.outbound.protection.outlook.com [104.47.36.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgDMf3fP4zF0sF
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 05:14:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4DwGnqqfGD3t01WBCUTQKwrZ21ZsA7CLQm/A5A5UtlY=;
 b=ZkAM64FTfW+xRPX4VT15MQL7clq3F3DdacB/0rgPWLknDVhKOIBVqqJPNhHfaQ4ChA90NH3GpC6pdI7FRUpxe83Iqh5GBWXSAwKl8zxGznCbV5W64BnBVTrnK+YinAzZHxuMuuzFOrBgU+Kot1KQ00ItBIZzTMo9sbA/qpJbrJA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Steven.Hill@cavium.com; 
Received: from [10.0.0.40] (50.83.62.27) by
 DM5PR07MB3612.namprd07.prod.outlook.com (2603:10b6:4:68::34) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.485.10; Mon, 12
 Feb 2018 18:14:12 +0000
Subject: Re: udev faulting with openbmc filesystem builds.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
 <CACPK8XdWGur=QB5QK+mja33M0bRkXGg9gCoVn_DdJF4vKD+p9g@mail.gmail.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <95cd4831-f9fb-0e72-9305-a249fc99c956@cavium.com>
Date: Mon, 12 Feb 2018 12:14:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdWGur=QB5QK+mja33M0bRkXGg9gCoVn_DdJF4vKD+p9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.83.62.27]
X-ClientProxiedBy: BN6PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:405:6f::21) To DM5PR07MB3612.namprd07.prod.outlook.com
 (2603:10b6:4:68::34)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7647d2fa-8cac-4811-9f04-08d572446bde
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
 SRVR:DM5PR07MB3612; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3612;
 3:NoCQ27ynY9AajkB4p1VeXb/MKfs5i83JbCa6JHbYUDaV2htdSy9p/VtFNr47Cd1/pceMXN5GJfCTmaKkQjRglB7achGZUoDyjRoRfapvGLUO9cCW7NrCowt9yDM9Ko6ZMhsIZHThlwdj5+zqnv2mhxzpzKy9nQJnT5rTMEMaYpOME1DRHF3GNQXmgk41feOIIegHfwmN41CTSSOU5Xl+2VeDRUy+z3wLv5iDxBfjnxGx1P8JIYkV93EmBfEi/bRT;
 25:UtSE9HH/8+Io0hvhKhV7hnNMv8MWPsjdDFQA5aHo/rULD3Fp5p+M4hDVt2VJ6CFgAcYBWRuMDD8W4a3KQXSVkkRPO13kRbY7B0iZWUhN/RDP50QSR1hSip5fPNcbUz1ANgdm1cbbUd2wr3XT9Z0W+ntxGIOKzhH4hjQB8Zs7da9IULSY+RKTowuU0Ox5rp7TfegtXQGnsW1P5nb1BXb2+awiRSyvlcaVuGmb9EqllhfRemdizX6g7JjKthbGiiTB7B18RrCPXvJqFXih0PwX4OogOwYWK7SSQVpFfnROhJ0RV70LbaI0gn4X7TCKqiuEGcfmdmlV4c7T0UeX0BB6XA==;
 31:C3pyBLiHG7EnXeJ4zvugWssE2/hfJHz+R/HIsRyG4IjefnUOix1q4oosjHCfQQZa4qxGWOXqnAU9gsRz+w2jrsYgV78JnKQrXujYBmHGty/lqNHJ7caNS+cYP87fF35noNZf+3Xumv1dKk9HpaX2fdUTJU+kzP3lxdzdyPLeZ4VKGiM0gsMs7ggOSEycMJr5zpzgMeHruWMWyxmPjVcm2BUf7r5V9CacJmgSorRFWTE=
X-MS-TrafficTypeDiagnostic: DM5PR07MB3612:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3612;
 20:YNcv7Xb4ZEY2ueTjZXziFL2GBdVVZ0OoaftulzJOAOXmuNRU0XGZEysoEB2LUgyPFBqpgF5O1uN6jGrV3P827YMHjcQqfO+gTyS2r3pHpnW2dVwcoEFnoOuRd6P79bcXw2DTdD8gCYWkE2EMvCT0h2XETyQdQHy2SxfY3XUk/s2kJjTxoWMSUSvUMu+Wdjt5A1AATzkmLxHZBHDRrtisWMKdgeNcgn1LHCb5XujScRIU26Jd5I11Q5a5QvlIuo5gye3r+5t8VofR8nQHED8CySdA0RYDZm91ivKLEZ/ZPOUsbWXqPCsHe1J1ZSPpI9Z3fcSW9eME0TeLLcOPy1RWZi6yMVjFLbLpH3w2SghbyoCAmjUNm0fSV+QGuH+ajsO3kHG7mhnTJxM08yD+EJVnWWdPpf8Li3gfLQ/yi8l7MFDOaKBIfS/h0+/RuL7MgPN+z+AfHC+80+Xzzjr6NvZ37FEWZ0FSfHkJWdjY9wE3rFnY5tbAiihqRyA1G4bdPk1s;
 4:RFs0qFCyPd4dp6sV7RCEyVoMqit2HIbjAiNNU+oFA/uad6zeRCfx3GodQNyz+VUURG5S5B8UF6HT7EEJIry7my77Cjdat83/iBVF2HwJbN4FJQXOvVxK4KDKnLDfjn8hJOmU9Avux/RVcno2Viya0AUF3gsrvEL/RDFitjjdb7MHj4tE9FTZGHVvAzxTV1ebmd0fBr77/CFSzU8UX7vLqVBM8gR/9U2HFS64s1hCtOn6/bwwZ3pT4iUZSsa9ksCmBLrZT8vGr3UmaKUZW9a+PiN7gOMJNK2ikr6jlFt+uqU6qlWvEdcDrXmk7tENYdI3w/VnCCvbLpB6a0Pk08mIDj2Zp1QY0t5j1OWpRPPHndU=
X-Microsoft-Antispam-PRVS: <DM5PR07MB3612BC955C704229AEE8A80A80F70@DM5PR07MB3612.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(155532106045638)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231101)(944501161)(6041288)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(6072148)(201708071742011);
 SRVR:DM5PR07MB3612; BCL:0; PCL:0; RULEID:; SRVR:DM5PR07MB3612; 
X-Forefront-PRVS: 0581B5AB35
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(6049001)(39850400004)(346002)(376002)(366004)(396003)(39380400002)(199004)(189003)(305945005)(6116002)(3846002)(6916009)(186003)(2906002)(16526019)(36756003)(68736007)(2950100002)(52116002)(53936002)(23676004)(81166006)(52146003)(106356001)(4326008)(81156014)(97736004)(230700001)(65826007)(6486002)(2486003)(8676002)(31696002)(105586002)(83506002)(8936002)(25786009)(53546011)(31686004)(45080400002)(386003)(229853002)(86362001)(66066001)(478600001)(64126003)(59450400001)(7736002)(5660300001)(50466002)(316002)(16576012)(65956001)(65806001)(26005)(58126008)(76176011)(72206003)(6246003)(47776003)(77096007)(21314002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3612; H:[10.0.0.40]; FPR:; SPF:None;
 PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3TUIzNjEyOzIzOmJ0dEZoT3BtT0V6TUp1QWFlUDkvWWpFQTNM?=
 =?utf-8?B?bXo3bVUrdEJZUFJpVnRaQ09xV0JmRFpteEpnSW9IcHJrWnYxN3NudVZjLzNN?=
 =?utf-8?B?bHVoRjNqUWt3TkVzWW1FdGdsVUQzN0hWOThvRDBsSlY3QTdUYnBNejRLVnFn?=
 =?utf-8?B?eU43WHNlYlFQNHNWK0t5ZWhuUUJCU0N0R1pDek84ZlkwTldXZWc4amhkTGZw?=
 =?utf-8?B?NVNoM0oyb1RSMkw1anFXcDJBMURBZ2VTZVBxQ2ppM00ySmp3a1ZWbFg3ZGJG?=
 =?utf-8?B?dy9MNG1oc0Q4RTZsYjZwTmxDSk5sSGRhYVI2a3JGclJzV3RMdXJXaE1EVkJy?=
 =?utf-8?B?MFl6UUs4ejhrb3JQaVBNNytIb0ozaXdQVWcxdUYzQmJOazU5aGgxT2NXRVhG?=
 =?utf-8?B?QkRoR1pBVEZLT2kxTHA1OElXdms2K0JmNFlyRzZxd0FmUFlWY0xvdVNkaXQ2?=
 =?utf-8?B?aVd0dXlEYncrRkdLMm01dUh4bFF6VlRHc1RKeHpJTWdOS01POFo4UFpEemx6?=
 =?utf-8?B?U2hJMk9GeXdwdjc4ckRpNzNmR2xpL2ZiWi9qNlY2aDhvSmtDMGIrZzJYZXJC?=
 =?utf-8?B?N2lybVVhU0lLRFdBa25WQlJiNjZGRElkcG1RL2U5bXJXRnhlbHAvZGdFd1Zt?=
 =?utf-8?B?SlZKUE1MWU5QYnBwZmRQbWZWZG9mdXFCZTRYVXdybzlPc1A0UWNYcERqaENm?=
 =?utf-8?B?QXpJNlpQc3BXd0xRc09SV2pIaVBVUnJwTmVFOE9tcFJYN2tZME1RdnZVU3pq?=
 =?utf-8?B?SkpQdlVTVW1oSkdIV0NwcjB4T0Rpb3ZsTHU5Nm9ibUw0U2owYVMrR01GdGF3?=
 =?utf-8?B?QlhYVXhSdW8wbVNKeDdmQ3VxVlNtbER0T01iMGtNeXpvTyswbWZ2MmM0OTUz?=
 =?utf-8?B?K2pBME5ZWVlRMXg2N215cEQvcXJ4TTlST3V5RTFMWk1heU1mTWRzam5JNnJD?=
 =?utf-8?B?am1BZUN3QmJ6cXdFOCt3a3dtczJvUmVpOU9DNU1MNm9Tc3lKZHlQbk1FOHlT?=
 =?utf-8?B?QmV4b3RYTVBKazdzOXN5UkFER3pod1VHLzEvdzlKb0t1ZUlSc0VieUFnUHhD?=
 =?utf-8?B?MmQxbzlRdFR2ejBOZmczbWFXaFFDQWNMOUZRbnR1RTdsanFDMHpEbGJyMTk5?=
 =?utf-8?B?dVBCM3Z6SENvMkw4aTI1Q0ljSndyd0VtUWV4S1pzUTh0TjVFNytodW9XZjdV?=
 =?utf-8?B?WDY3VmN2U2xWOFIrclRja200aUdtT0w4T2h2ZzBxYVdmL2cyRmdkeGYzNU9D?=
 =?utf-8?B?cTdEenBFYlNPSTNSeFVJUUpqbXdjTW8zcXhNZGl1SDhBV2hvK25xZ3Q4aXR5?=
 =?utf-8?B?ZjRieVB1dEpKMW1PN3M2ekFhTm1GZlhzYjhwcjF1a1YyUDliNWZ1bDRkam1X?=
 =?utf-8?B?dXJFMzNtaGJxQThGdS90S3p5alA3dHlEczRvMXBYOHZndkF3OEtTTy9sNFNL?=
 =?utf-8?B?SGcrdVZpb2Uwa0NZWmVtN3YyYklvUDhkVG9VelRhNkZzT0VrUnVreTBibWx1?=
 =?utf-8?B?U1FwS1ZqMzBCdi9LazBWRTJ1N2ZVUlhmNGdHN2t5L0VDM1JpV2pVUnN4dFUx?=
 =?utf-8?B?YllEWlhRR1dHTGpnTHZDRDVJL1hFb1ZmT1lHUXVXbFlOWDNTT1hCVEV0aW1M?=
 =?utf-8?B?cGV1VWlEZTJCK1BwUlJHRHlpM21ORFphWmFJSXYrdzIzdHExWGFZd0JaMm9z?=
 =?utf-8?B?ekREUnFaR3NuN1VSOUV5ZlhQa1FpVmNXRU5aMHFxM2Y1bWdLQi93MmVKRCtM?=
 =?utf-8?B?Sk5UWjMyK3l4VzQ3MXExNXBEbXdONTlONncrUDBST1U0alUxNDFqNEhzK3U5?=
 =?utf-8?B?M2pWcGlkb2poRGN4TUd6K1VsdGFzREZ1ZnZKUmRrWEc2NGNTUTJ3czZkWW41?=
 =?utf-8?B?bmpWLzVaZmZIblYwM3NtNU1JeVpOSm5VcXNhNXBHa0R4U2hpdld6d1pKVHNm?=
 =?utf-8?Q?fad4DSBooG1QrXngzTK73yppKOZy70=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3612;
 6:eg5ikJQmE8DxcQPsmxy39nSV/RnD12U6E64+KdJs2sTgv6t4xakuItZzg7QBaC2wxvHC9VcK/VNJrcXdgSbiW7KnR+v9VtatCMi3nCmBoyH80Nkmq5CoejnipQs7XaPkevdOyTVdzZ8Xcxqzl+dSOYUOtjYayw8ZmCjLWKSxy6Cm0ONyXgKLystZpBo2DcTQni+2oRKwibRjEcNT1YytfxAlNd2PYsdvE3K8bb4+JAltkbITgNoiP9OV9ADelWasQ2KH7pbler+RFNo5bOArcCJbtNT2XpAc1+LsdNgXblR8lsYM/Hao3Xe+gSobpJcc+3rkFrmsoIO9jT0pEs5hUUThP2XCnRltAcz/38qmSVU=;
 5:sqJVSpDz+MSsciMUexuYWSZZQD0CS+6XJ8JqNlHdIQgI1g1oYqFNdOuVwR1AjX02/LLXeX111/vm6kV8VRxv41AjWT4ldr2e7Ek+cPGSGiufyGJZ05Ae20dJDvbkCnvcYIdJMZdwEh8u9br5onMNF4qkzXGBltUza8dVE51x9YU=;
 24:W1TQIBXGLe8raHt8rHQW23xuZJ0y1SN+AXvliIBKdpApVYxxgotWbxsjCZ6rANit6eRlWoW52g+gnh0cMyIDHhxG264uGsc/73p9atgM1ns=;
 7:F0XcoY10Y01VTD7Gxpxggz+oqvRi2Eus09lAaGStd1bHPm20JQSuW7LlYwwji2DL9uMi2sAFfiN71363PR11asOGDsCMPXyMCXElWFNP2sxk7pQlwbCUevgNVc2HZlowa/G2AXv4PwxZr66HSVoLWTzc8gh2YdT3NdBUVMWXyT1uLn6snw8njlE94aoCm8LFOtAnn0qpAhxd6cL0kp9HsoxydDk7faPs7Km0J5U/UDK63p8G8PdQKgkk4vALid06
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2018 18:14:12.9325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7647d2fa-8cac-4811-9f04-08d572446bde
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3612
X-Mailman-Approved-At: Tue, 13 Feb 2018 09:12:13 +1100
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
X-List-Received-Date: Mon, 12 Feb 2018 18:14:23 -0000

On 02/12/2018 12:44 AM, Joel Stanley wrote:
> 
> Do your other filesystems have similar userspace components, such as systemd?
> 
> Have you tried to reproduce using the OpenBMC kernel?
> 
Joel,

Yes, I have tried the OpenBMC kernel and get the same results. Let me outline
my platform, kernel versions tried, etc. for completeness.

Developing on Aspeed AST2500 evaluation board. The core is an AST2500-A1.
The detailed core information from the kernel is:

   CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5307d
   CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
   OF: fdt: Machine model: AST2500 EVB

Kernels that I have tested:

   Palmetto (built by the OBMC build system)
   Witherspoon (built by the OBMC build system)
   Generic OpenBMC kernel from 'dev-4.10' branch
   Aspeed SDK kernel based on 4.9 (supplied from Aspeed)
   Aspeed SDK kernel based on 4.10 (ported by me)
   Aspeed SDK kernel based on 4.11 (ported by me)
   Aspeed SDK kernel based on 4.12 (ported by me)
   Aspeed SDK kernel based on 4.13 (ported by me)
   Aspeed SDK kernel based on 4.14 (ported by me)
   Aspeed SDK kernel based on 4.15 (ported by me)

Root filesystems tested, all using systemd:

   Palmetto
   Witherspoon
   buildroot (HEAD)

All kernel/RFS combinations fault at exactly the same function inside
of 'udevadm' shown below. It is always the 'strlen' function. For all
test runs the virtual address is always aligned on a 4KB page boundary.
I have tried variations of SLUB, SLAB, enabling errata workarounds,
passing different 'mem=xxx' to the kernel, kernel hacking options,
"kernel mem{cpy,set}() for {copy_to,clear}_user()" option and others.
This is where I am currently. Any insight would be great. Cheers.

Steve



Unable to handle kernel paging request at virtual address 9bc8c000
pgd = db438000
[9bc8c000] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 PID: 900 Comm: udevadm Not tainted 4.10.0+ #3
Hardware name: ASpeed BMC SoC
task: dbed7880 task.stack: db4ae000
PC is at strlen+0xc/0x38
LR is at kstrdup+0x20/0x58
pc : [<c01f610c>]    lr : [<c00965ec>]    psr: a0000013
sp : db4afd30  ip : db4afd40  fp : db4afd3c
r10: db5a88c0  r9 : dbda1f08  r8 : 00000fff
r7 : db4afd9a  r6 : 9bc8c000  r5 : c0269d9c  r4 : 014000c0
r3 : dbdbf990  r2 : 0000f000  r1 : 014000c0  r0 : 9bc8c000
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 00c5387d  Table: 9b438008  DAC: 00000055
Process udevadm (pid: 900, stack limit = 0xdb4ae188)
Stack: (0xdb4afd30 to 0xdb4b0000)
...
...
...
Backtrace:
[<c01f6100>] (strlen) from [<c00965ec>] (kstrdup+0x20/0x58)
[<c00965cc>] (kstrdup) from [<c0269d9c>] (misc_devnode+0x38/0x40)
 r7:db4afd9a r6:dbda1f00 r5:db4afd9c r4:dbda1f08
[<c0269d64>] (misc_devnode) from [<c026e7b0>] (device_get_devnode+0x78/0xdc)
[<c026e738>] (device_get_devnode) from [<c026e950>] (dev_uevent+0x13c/0x1e0)
