Return-Path: <Steven.Hill@cavium.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cavium.com
 (client-ip=104.47.33.87; helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=steven.hill@cavium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=CAVIUMNETWORKS.onmicrosoft.com
 header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="J0Umh0JE"; 
 dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0087.outbound.protection.outlook.com [104.47.33.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgL3P1qg9zF0l6
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 09:30:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ydZAD9UaXy0QUCsmtrVCkWYiqIeNxBXns+1XGL4zLd4=;
 b=J0Umh0JEg4cQTciIQDU4CrmOYtGi8gA6X+zNbAIX9a3IDiHCJdn2oPW4W+arKEsBxDGISs5sG9Tyl4kJ/zCSd8T2wtRfP87JFio0+wx+Pe7y7KVKU4r0L/lqus230dhOKnaeBc0QGv6gM0h6/oQIS3nM5Gug+PN640zxHTeFHR4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Steven.Hill@cavium.com; 
Received: from [10.0.0.40] (50.83.62.27) by
 BN6PR07MB3604.namprd07.prod.outlook.com (10.161.153.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.485.10; Mon, 12 Feb 2018 22:30:30 +0000
Subject: Re: udev faulting with openbmc filesystem builds.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
References: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
 <1BCA93AD-4C31-41D1-A158-D460D6E05F31@fuzziesquirrel.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <70687af9-6364-aa06-0f45-9884813394cc@cavium.com>
Date: Mon, 12 Feb 2018 16:30:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1BCA93AD-4C31-41D1-A158-D460D6E05F31@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [50.83.62.27]
X-ClientProxiedBy: CY4PR13CA0011.namprd13.prod.outlook.com (10.168.161.149) To
 BN6PR07MB3604.namprd07.prod.outlook.com (10.161.153.159)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a5f885-c250-4ae0-063f-08d5726839a9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
 SRVR:BN6PR07MB3604; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3604;
 3:t0gxWUABjtsrogEZyiPrTUxe2cq+BEhYDv4VPep+D97qCEM08prAm3IsT1+8Yy9mwwaUmdnKnqRkKziJeEijlQPeR1VcFugPbBB+1R/QH/Zo4iLh2l6Frai0M8oG+o+Twh2Bk8RvPEZjPlLAHZ7jJRmd4wmbzfvUez54Bwq042bLrYGqYgHBTDwqxzEH/mwobIt0+viCPBkU9OKNMo/Cw2XLl36IEs4CY62XSehwPdHf+fu0PIDV27naJpPBr8hf;
 25:XhPQ6f0QTUfdhaxHdUmBX6wx9in6/Wegop6Flcac3k6yWfYMX1Smr7ZjQlBddeie6NdCchZhKB+ND9NrocGG6weIwGjcZsGNSyacLnrGJBDckdwyhMA/k83xVqRwvdJpkzUBMZFwpujhwOTNxmJCCUcBJ1ar7/AIS86nBzut64FIGv5UJXPh+xq/kesBOdqZ3CZHIUr8XP9SvSfZljq1ZT8PNpl4KZ0igBiYJxSolCRSioEFOxsECBY+YmES0o2JJA+nLf297wXznUlndP+5xS7JjaPoJtmdxOOMON19bCuKzGh1hDh/fZThUFWBMVwGEJIcQ7XqDRn35CHZ+45zzg==;
 31:4NBbep+55NHG/pU6vdVG//EIsqQgH3ON82B0kAbUeGKZhQyG9/QdgzWyi+/YC/acDW9d76gEd//2dAFQ6W1yU383jGYQ+wAX4Saa93ClCs/wqeRZxGIWY4HwmwVodsJr+kIXGkLikzftjVyfqIb172XvmlAEtLerrIwprFvngqUR+b48XGcOoztNF4mXe1i/Se5khTw8+CIAQRCq7IGaVlHw+szjPCtqwqaPfZSPDiQ=
X-MS-TrafficTypeDiagnostic: BN6PR07MB3604:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3604;
 20:1npquwC9O8GxIz3GDwfDnb5VnVv4edfL7IR//kbdCoQVJy4LG7RNlmjjiWjR38JUhtXdMGX3O+z6yvepcxU6zJMfW1QnGM/FJdn0s+3Dkl9CojMhtdepC9IdrWwVW3AItC4BF1jUj9X+BuzZh4Gz2vTF4DAsYs8qpRwayVJIQvTfOJAE1w/vqRvDLtihsgxRkfdvmsivUO32jnUpvUWKzhEWV1xtiDfp4hsZ7IPK+t8L9NdUQH8gikzZA56ODIiuLWi1+8zqfxuWxKEPAAEaLU8pXn2uk+rsjv/7YvLLD3M+ghGxRMLbruwJYg2zN/Rmp/F8lRV+ymegI3f2YS+SJgLi/oYd7J0OU9QV6WjN6DJXquV1BGPXKjndeb1HEIB5hMkp/trTzwf58WlRfFdy6x+UOVFHI8SbXuJedS+aJQB3+CzX1TAKFjteNoNLlKbMuizQIiB0cfC4lO2EjlPhtcFNHt8bcsjS9DFiF0Z6lX6Ynkh4+yLQF+T8lw4ezCOE;
 4:KcnDwdMp84YEWqkQED7pYY8pnrEs7mzP3vL2nJK/3XVC32UJNiR3Ih4Rd3XX6BHILMxgXYnUhyCHBxqxwZI5fDxMcxRyd0qI8dHY3y7u1UhkJ4RhQyCAcG5k6cscGjW0kqZA/56/DwU88h5IQvgNhVfcPOIx8YnhISCgTvNKvOyH5N7Ns1Y6lAtCZ5Vbn/bi65u1474yYHUmjFmXObtW38DwxpLAI3wt9z4e+XSXcGBpUswOw+J+dsQRbrBqSbSYLiUxMRVK3HtfwWi5iI02JoZ1VpSZl7/QITpJZummv1wbtiTzHsEq5K8OlB+VK1Fs
X-Microsoft-Antispam-PRVS: <BN6PR07MB36040B5A5E01B23CFADB7FE380F70@BN6PR07MB3604.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231101)(944501161)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:BN6PR07MB3604; BCL:0; PCL:0; RULEID:; SRVR:BN6PR07MB3604; 
X-Forefront-PRVS: 0581B5AB35
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(6049001)(366004)(39860400002)(39380400002)(376002)(346002)(396003)(199004)(189003)(66066001)(6916009)(105586002)(97736004)(52146003)(23676004)(2486003)(58126008)(16576012)(47776003)(52116002)(83506002)(31686004)(106356001)(59450400001)(16526019)(50466002)(316002)(53546011)(386003)(64126003)(76176011)(26005)(68736007)(77096007)(186003)(65956001)(2950100002)(65806001)(81166006)(81156014)(90366009)(65826007)(7736002)(6486002)(5660300001)(25786009)(3846002)(6116002)(4326008)(305945005)(8676002)(2906002)(72206003)(36756003)(53936002)(86362001)(6246003)(8936002)(478600001)(31696002)(229853002)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR07MB3604; H:[10.0.0.40]; FPR:; SPF:None;
 PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA3TUIzNjA0OzIzOkFoWWE0ckh1RjIyaHFmWjdMS1llbmc2aExQ?=
 =?utf-8?B?aDR2YWxjcFN6eEhyNjNvNC9pOHpNVFFncjJ1dlVRR3FpVG4zenRTNmV6aU1m?=
 =?utf-8?B?VHhONTlkanRGV1lHcEk4c1dXeGIxdjI4NUpCR0U5ZU5ZRlVDMWFnOSt3Skdv?=
 =?utf-8?B?ZFEzZkZJSmtvUStOUE9iWlZSdmlUdisvTFcyVWtyZmRjY3IrWk55cXhmV0o3?=
 =?utf-8?B?Qjh2eEoxWGlPdFlyWGtkZS9BZmNOZCtWY3Nac0RyanIrdFErMXJpU1ZKL3p4?=
 =?utf-8?B?K253OVFhcW5iUk5YV0lJUmcwTFlhWGNYZ0pIdlMvUmlyNTg0b2pMcmpXNXo2?=
 =?utf-8?B?d3dSVjZJWXJmNlpZL3dPV0hyRHpCdmIwYjhJT1V1TlJYaUpjU0ZkT2ZPTmNs?=
 =?utf-8?B?WjRRUjRRQ3dHVUliOGhhWlVySnRWaDQ2QWRRR2NzWDg5VG1OdkltTURGdWQ3?=
 =?utf-8?B?eWFCMDAwZU5aSFpleTNhWExYUGREWWtCWjltWExIQWRabi96S2MyT2V2eTBS?=
 =?utf-8?B?VHZJU3ZNUnZyQ3lBcW1lMmlSOTA3K1M1b25nSHNoVUhjaW4rUTIxekZvKzZW?=
 =?utf-8?B?OERCbVFTU0Y3RlFxdXUwSjluZW1QNisvQ1ZQVUR6Z2dRSnNPcUZHTTFSRUlQ?=
 =?utf-8?B?UkFmSU43VUpSejdMaFhhNXk4YjdmVW9rVWZBSEZKNW9WM2FYZ0tHdjV3L1VY?=
 =?utf-8?B?bThFc2tTTHNVZkZBRUdIRVY3bWpkNVVsVkFpandEMUJESDVDWUNlUmIxQ1ln?=
 =?utf-8?B?Z3dtYlk5MXEzcEZpVG9vYUk5STlPb3NuRDlFUG55Y3Y4ZFBxL2hieCt1UWNt?=
 =?utf-8?B?QU5hSmhMY2w4OXJoSHpkcVdPSTBhY1FJOUtJZ3h6UWo0OHFOS1hxdVd3Z0dw?=
 =?utf-8?B?VW1kRGpFaWQyWkl3R3JwcERsWjZTWXF3ZXJPOFpWd1pyV1hqS1QvU0FucStX?=
 =?utf-8?B?RllocXFPRGROV0NCWGpoTHY3U0pnSzhNeUZ1VmRiSmwzaSthL2dpdDhWNlR6?=
 =?utf-8?B?bzBUaGpabytUQzRxaEJSN2FPcy84ZjJpUzlXMjRmOVRMdy90ajZJaXViK2pD?=
 =?utf-8?B?ZlhGWnlvbCtGWHBJSzIvalhnb1hPNUNaTUpqS21SNERQQS9PV2JROUJSdTJp?=
 =?utf-8?B?Q3QvSk5uaGVjaTJqWDVFaFFrRTF2VUM1V3NhWmoweTYvT3gweEplNERad3c0?=
 =?utf-8?B?VHpBaFJQSENkaUxndldDQkpFOExpWW4xRXRIT2hGZTdmYzdsV0dWMit0cjVE?=
 =?utf-8?B?OW5HbU9aeFRPM2NlSlAvVTNOWjRqc1lBdnhJSjNTNit5ak5IVnJrZVRFbTVI?=
 =?utf-8?B?Z2tISWIyREVCUFA5QzFBMFZFWG9aWE4zM2dQdllMRllGNGorUEl2ZURxV29z?=
 =?utf-8?B?Q2NNRTBHcytqUkQ5YktpNTJjSDNqaGFXZ294QjlOSk4zblltZXNkdXFGeWkr?=
 =?utf-8?B?TzY0NXNYK1FDMXZQVTNZcGNJamo2VjdGbnNxR1g5UzNkVVBzYW9YbkxRYjlO?=
 =?utf-8?B?NXFPYkg4bmhSdW14dDd1eFY1YTVMeGpGZ0h1YWg5eTBJVE0zdEQ0NXlwVENJ?=
 =?utf-8?B?RzJsd0Fya1ZWUnZqTi9jeVhJSVk5aEJwWTFSQmY2WjRqOHVFQzNBNy9oNU93?=
 =?utf-8?B?TWJnOXFWMU9kSmJIMmMrTGpxRmNsSllHeGI0anY5SnFIZXpXV0hpQm1uK3da?=
 =?utf-8?B?MC80RVBPUFZIMjcxUlkwczNvcDRWd2hMVjY5YVh2eW14OGJ0T0pta2cxUWY1?=
 =?utf-8?B?a0JjZG5FQnFrWURRdW1sSzFBRXpyQnZnNjlCNytoZVFkMmh2NDRDUDFrNW1k?=
 =?utf-8?B?c2NwTUpzSUM0d0l4em8wUmRXVlczd2d2WitsMDVMMTdqUGhGMWFOOUJtVVlx?=
 =?utf-8?Q?06SGid8KARPeMo90P8XwitigQ1gmi+kd?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3604;
 6:11A/0o73KnbdL0c+xJonu5ylvUa9GKIFAKPpqKDFKdt9UxmVpvHuGQlqvFjimIG7fIuDaZ1ssnKCanU4pUOwiQXNmmSH0brY7YxbqD0T8bW2yh5IRDswTNXTNdFkQIlZ9qI81sKbxtJ/zkMQ6VsZk/pDH7P5+uCkagVgqNaqa6qh1eGd+BU24FjwcPppWOnHEyxfGjfBiBRojg9AK9DHmkzfBEHWiaCOdkzmZgoNG7NoX9m96dnpEa1PjJvpSyCtDf9arKq3STRCnWerSflk9qvaV+n5kMlkSNfjze3H+erseAE7YzlnuUJGZSZ6YvXcS+zl4ZsAL/44bE1EfrqVFyRCqzRjIZQ02R9vM1Iz2t0=;
 5:N0pgVTttXowGZaTbLFwDvEUbKKlH3jjDKmN7410fg/uqZYv9dUyHvd40v1FGzYLjMV6/T4+I39EmCiAlnMTNmQt7hoY5m25XJdCHL2VGTtZLM7oQdEM4BXrhpr6J0bvst1+muIwi34q3RjcBRwUtRXOi79HVmjP55uYv4buV7bo=;
 24:B4koGREf8Is3hIDnzB6nAY8skODs8IYi3pvuQdDp+wirs8iDtCrCI1SBJuReV0G6QyD6hNlGKCpA9839K8Kdqb6W53WMd3tFWtyoSKoUMRI=;
 7:N0XGDd4Tr46CAZbGBzUisB8uInwaGANrNyA8mKANRJaWTFT6+cRjkWAXIF9SQn0aQAb+PHr87RezyU5NmZYRuhy748wJquiHO0vDXmhlY6Kwjr/ZfGWuuifEzPaI4Ae36VQrr802aZrkrzzra29x2OYWHbuCoDepIEt7u3fMJ5byq2dvUgSpyqq3/oYIMwsMuULahWP25gt9l1kWi1FmUCymJ7oi2gZ6Lf6FCqTInzuQQ86S263/TMHSG6yHb/lF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2018 22:30:30.7805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a5f885-c250-4ae0-063f-08d5726839a9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3604
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
X-List-Received-Date: Mon, 12 Feb 2018 22:30:42 -0000

On 02/12/2018 01:26 PM, Brad Bishop wrote:
> 
> Can you elaborate on the trouble you had?  This isn’t the first time I’ve heard
> of people having trouble subscribing to the list.  I would like to get this fixed
> up.
> 
I took Jeremy's input and opened up a ticket internally to see WTH our
mail server is doing. I will ask for details once they fix this.
