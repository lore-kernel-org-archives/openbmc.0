Return-Path: <jiri@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.1.51; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=jiri@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="T5n6yu9w";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0051.outbound.protection.outlook.com [104.47.1.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5V3p2DclzDr5w
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 19:47:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O5wPG8POygsunkycyZ4mWDfpFxsMxpPMtgfLY9F9Zm0=;
 b=T5n6yu9wsndT7iVu6ZrKlgZI8J8BDFriSX0uuSTKSwj9tqKBcPuoymATxWaTZ/9AQvEi54irwFKL4mZQGDqbn3p/vwt1fSTWZQGaoRsN6ZBVQlPzAMrI3MCAjKKr1BBfVSX5HPUM3ULUALRQpcCNVStckME9s2BGR7lmhDNjdbI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jiri@mellanox.com; 
Received: from nanopsycho (84.16.102.26) by
 DB5PR05MB1749.eurprd05.prod.outlook.com (2a01:111:e400:5bc4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.345.14; Tue, 26
 Dec 2017 08:47:20 +0000
Date: Tue, 26 Dec 2017 09:47:13 +0100
From: Jiri Pirko <jiri@mellanox.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org
Subject: Re: [patch v15 1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20171226084713.GA2175@nanopsycho>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-2-git-send-email-oleksandrs@mellanox.com>
 <13433849-cb7d-e2c0-4ce9-d91a6012d7d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13433849-cb7d-e2c0-4ce9-d91a6012d7d7@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Originating-IP: [84.16.102.26]
X-ClientProxiedBy: DB5PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2a01:111:e400:5a82::18) To DB5PR05MB1749.eurprd05.prod.outlook.com
 (2a01:111:e400:5bc4::19)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23ef0658-1796-4348-67d4-08d54c3d476e
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(48565401081)(2017052603307)(7153060);
 SRVR:DB5PR05MB1749; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR05MB1749;
 3:+Hs4sn4LuMTbJGcaAsDZoa203bLH1SGKBCWySV19j5TNtvOJsTtbkPZEavyBS3zXhG1JuFyOHrhSBfF3KhArr7loJC58r0N2Qf9CrHVO1nUeaEJidesRSkc20EdahNsYzu0zL5uv8//bRT18EKsa8uZT3VAqfzqUx2HILVnZ0YqEeDbNKAsQUpIgPfm69oXikCcc2KqKCjEdR9W/1R2aJpAHHJTr7gNb74r/G9MbJSwoc9/6+/NSN8hfpH/Q7A+e;
 25:onPaeZVxtWVvyNmdUPvSOP5jgbDQ9Bo5nP9YomowVv1EcqssXCHmg0/S7FvT4+3BYXeP24YDkG7FU4PUXB9P1mpEM3E3LNtyDPh+opddNpaPGQA6I2bXqEM6UjU1cZtbI1Ipu0fZv36GFf4XrwaDcMaru/n0d0p5cmSHzAJ5fJNugNghp9r7nXFZUPwciY4oe4jPGFHYVHGOw4lcE0m4rs1OFEiDwJv4ji+asmA9Q38UKecqdPCIm5BMhRbc87KDp3d1PWOL7qhAtQo4+E8qjyOJYNHb1NoZK82I1vZRxSgWp+X3y1puqU4rRil8PhuCVXrOCtWtC1E8HGGyqpNwgw==;
 31:y84BjbUYeMrccLUSh3/+2JHrefexQZBtbVfTwDKzeqXvBqvWfNzlrRjngK5/RG4GyUt0xWuIb+hjiXgQyWOvEtEWV4qj0VV0lIz2sS1/6M7QZCUlrJXeNGNxa1wysVgADbJvTUZPwIvYHHQTU7HhcUCF3O/FDPGTUAcorgS6SbtbbHE0BddImTmHzIU9kXOYGVsdf1LKg1urNvv1rmYbUH1nOI2ij+G+rZGMSMP5XRQ=
X-MS-TrafficTypeDiagnostic: DB5PR05MB1749:
X-Microsoft-Exchange-Diagnostics: 1; DB5PR05MB1749;
 20:cYFl9ed3icusPdErvYUzV83ZmCQbwXIkmZqGPYWVc3o/ef7H9vIl0/sCjxIp9AEyC89wMhBgPUuukNN8XmTkrT/b0RaOrMSMhwX86j0Ys1srFPLEnfG3t6yiJW/9jmVp6ny6cZlCZD1wW39qd3EGsuBXXdC1+rfGkAIm7duk71PzAZ0R02T45R+oyKOZBQllnRQJXIaZityeMavJXZ5UbcY9AT4iqXt9L7rOOOZkZmCa1TZ41VEl41ynMLZwQPB+0eyBJ6gcAbM0t6x07+6+kNfL+Skaaee6qI44nXtWMhUQI9/0rvDzADqKfuW0e0gO0T+F46qb2VIVOu2mDbjVkNzQmzjunXwshoT+OcwJuJtOHdIurvpTJ1tQrkEi70ybcaRceGfrsyFA/UUZ1uY5ftTLKOzr5yZzALpXSlbX3Ejy/0/24gCEcyJlejFOJDHvTNs/Ljysg+adV6CDpVhF+5pf7RnejT0l+F9kStR2ZRnt89CCnsfIFQ64wuK4JWxL;
 4:lVY4Hm+B3xjvVdxZRIV5krGCy91wqQCvvYyhE/c58A6QU1AqqpVoqDN1gWFFLDNepAzqkU8YNfEL17JhjdZ+rw3N1eHNMCssycvktT6wAiGY+EFLoja/jGypkjoo9bGRsVnxuL3aWTm43slzpnBUJqA02Opmv5XvKzZkw7cTuqnPAUc+G/3ygfYhbrzECxNvcJsWcz5reelvk0hnNucHMUQqrvzPX4d0dYkwan5JEktSMpsgFT0M1iMO+8xAjwZ1tq4P+MHzezUWQ6p9TfS4OA==
X-Microsoft-Antispam-PRVS: <DB5PR05MB17493A457FA8B405951F40B5BD060@DB5PR05MB1749.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231023)(944501075)(6055026)(6041268)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(6072148)(201708071742011);
 SRVR:DB5PR05MB1749; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:DB5PR05MB1749; 
X-Forefront-PRVS: 053315510E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(366004)(376002)(396003)(39380400002)(199004)(189003)(24454002)(33716001)(7736002)(83506002)(6496006)(66066001)(68736007)(52116002)(9686003)(39060400002)(5660300001)(305945005)(6116002)(3846002)(76176011)(8676002)(386003)(81166006)(33896004)(1076002)(97736004)(81156014)(6246003)(53936002)(4326008)(50466002)(229853002)(47776003)(86362001)(6666003)(16526018)(55016002)(106356001)(25786009)(2950100002)(23756003)(6916009)(33656002)(58126008)(478600001)(105586002)(316002)(2870700001)(8936002)(7416002)(2906002)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1749; H:nanopsycho; FPR:; SPF:None;
 PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?iso-8859-1?Q?1; DB5PR05MB1749;
 23:A+gFzwpL5CS+CKoPYNRITL379eqxSj1KKIqsHVN?=
 =?iso-8859-1?Q?jygRxH1bmBTc5dPxxeqS/CCcVOFDjr8NkpRuFzzApfO+vJwcUaqvNw+URX?=
 =?iso-8859-1?Q?gHndOtJJJs+aNKSC+dhjCff2KOBviG7iOS6zpQp7SVL3b9BmDRlPNEUA+w?=
 =?iso-8859-1?Q?4DJ0Zh0k30m+WhiQR0hiSOVnJothTcow0Letn0tdxZErFRjHfPPn7PaFVo?=
 =?iso-8859-1?Q?WqYAxTRnX0FTqD5/euETbA1Bjh8EYGZW3IGhn7p2S+XxUpFIoS3JOf75A6?=
 =?iso-8859-1?Q?SCyooRzOd59ausnsL7ee3PNxOfNsIwZ1vXEV+Yc54u3fGJb+8HOxeHZPMD?=
 =?iso-8859-1?Q?yDqkPZxfNh/KsUvageO/TFRjdXY7/0fJvwQJH7BqAO/lqyowqbe0XAQMdS?=
 =?iso-8859-1?Q?X5O/MUvmnHL9pfQqEOXWgHy6IluePdCgmpYMDN4un9tdjJiGzu0Fyx4mIW?=
 =?iso-8859-1?Q?KnqPSt3OG9yZK7xMwVWsrERmWDaSzpgMyAGPW9+uMdEs5i+oBRTHoyN259?=
 =?iso-8859-1?Q?fhrYDxLMUiQO/vp/oWi/yg7rX7QcEJdtcTSiTNvrICJHa0ZvnsFDfykjD0?=
 =?iso-8859-1?Q?JEz6KqaGpE42vIx2nxGZtPfKkXykxuqADPBHqAn8BC0M5Rd5KpewW99s7u?=
 =?iso-8859-1?Q?Bw2C4T+8u/ZsZhAKxlNbsFBJoDEz73Jq/CdNWGNX89SM7iwFhVlMdnIuDN?=
 =?iso-8859-1?Q?n77gXrAGG1BAn/boTEQLlfnoazWWS4GNc8cAe9I7AiVpZCVr1ANgIrQDIY?=
 =?iso-8859-1?Q?iWShnMgQ7CylXhtNsp49ZQXbaNWYMKfEe7L8ZhKYkRAXAMqq+QjtS5EDD7?=
 =?iso-8859-1?Q?S3EnG0R9dBNNC/D0ajmXXvjIqrscC9AxwM+c7tbnAOheRPiOCRcb0MCObF?=
 =?iso-8859-1?Q?g3mZNVooaEMwflIdZZqdYkFVLW4crjPijZ7BjEcZ6jIHlFIdbYw+Vx1yky?=
 =?iso-8859-1?Q?JNyDdh3hoOb45znFKGzIGI7maEy4jCXuuiRjA9ctk8FWtuFXxwFPK9VoXy?=
 =?iso-8859-1?Q?OlnUBpGsiyFUUSy9nBWsOT7s1hYyR7RhJq3vWfzlftCTi1zEhuf8esn3rX?=
 =?iso-8859-1?Q?++g7C4lU7u+dDQRuV+VD4A47/mDDU6WoP6JDJFbCe1uYiG0co4pE98VsFB?=
 =?iso-8859-1?Q?ga1HC8eltEubhLlIhP3djNWzjZb54NNcR7s1+DCtH83KiU0zoDkvK0j8Cz?=
 =?iso-8859-1?Q?Li/m1/XbUdypBdY7num/QILzk0Bk1b3jHisLG5Mh8WGxufELg02gVzDTAk?=
 =?iso-8859-1?Q?7+dkyTvA1iN8De1suYtCOcZaU838x2RYHQLmwqfdD4UFMnfsW0Se3YVMMV?=
 =?iso-8859-1?Q?7E1cYidAl5a9ddUq+0gkXvM?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR05MB1749;
 6:Iuu66VHghgEXl66d/y58I+OIZECCSWLTJ7eO7MB1QXB9mNxbnHGoewjSrHu+jN9SlV5gIMFhfcMnKEM9JCpEmrjKSADqcmJC8/o5QE5s+yBCOFXpOa425Chp2gT/aKb643KEkyNmCBij8p19XspRjsALG4zxtaTujyy6xnLsu/XtgV0Z7Nrgdy3qV+VyO0IdPA8OXBjRwIK2pi5r/3EtoVFCDTDr3OwhuxgU9hHAuaPDFUM0Mdvvt4UCgG86ApNNep2j6Lhb+X6vKkvcMSixEOb3vZk3wFP+l72oYby+qPiqkCoR6aqyky2mV1da0rGRiMr2xtRgALhYkNO/bsGYIvOZm2t6bHyuS/eIH0EtUjM=;
 5:XrR3W6S6hddyIBNH6lIj23S4/1pNbJULcp5B4m7eGamYNIn8Ir7Zi1j6JhsLRRWx6m1HyNK5uJ6hR9Y8kiN4jB5/Pdt8YGrN+rBK/JH0s32tY6sgrWhKWBMdpTWAb/RiLRPfXZ+AHSAjPxq+g4nK/O7v1fRKLdKV3JFv7cN5nes=;
 24:lh/TiH1xVazkpINbmF6gRgDokuYsRKzBATy/bDVyMMkVVT7nmD/W9/UJ+TB8uqVqnDyW2z6uGMpyRreiRQ6jfRD2dX64eJJxNcuesxMCzGQ=;
 7:5utsENxobB/YqcZMu5I7wZ3b2OBpEDsIuW0Ps1bO1r3Ay8I6MX+/GBPvZ13y0bTymcqYFe7elbD6fNAqImKreGXICYK63u/JfV99sBzFhx9fJAKdGCsuNq3Xv1UfpdiBj2ooiQv31XBiL9ZK0wE7OI2ekEiY54e8sKJRobgrPdUJa2RO9YYewXURKy/hXzNlYWrw9fnSAbiYwA/RAHBIT41aQia23KlXsIZW3GyXfqhq2pxfjbWd+GNO0ia2Nmci
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2017 08:47:20.8239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ef0658-1796-4348-67d4-08d54c3d476e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1749
X-Mailman-Approved-At: Tue, 02 Jan 2018 15:43:17 +1100
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
X-List-Received-Date: Tue, 26 Dec 2017 08:47:37 -0000

Tue, Dec 26, 2017 at 12:09:08AM CET, f.fainelli@gmail.com wrote:
>Le 12/25/17 à 03:53, Oleksandr Shamray a écrit :

[...]

>[snip]
>
>> +
>> +void *jtag_priv(struct jtag *jtag)
>> +{
>> +	return jtag->priv;
>> +}
>> +EXPORT_SYMBOL_GPL(jtag_priv);
>
>Can't you just create a static inline function in the public header for
>that? This is usually what subsystems do, I can understand why you would
>not want to expose struct jtag to other parts of the kernel, but still,
>this looks ugly, so maybe consider splitting the header between provider
>and consumer?

Other subsystems expose the struct. Here, it is intentional to don't
expose the struct, that's why we have this helper. What is ugly about
that? :)
