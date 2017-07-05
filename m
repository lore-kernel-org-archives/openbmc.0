Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x2vk519bFzDr4P
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 07:52:45 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v65LmsSA072112
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jul 2017 17:52:42 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bgvybpr10-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 17:52:41 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 5 Jul 2017 17:52:40 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 5 Jul 2017 17:52:37 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v65Lqa4i56885356; Wed, 5 Jul 2017 21:52:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5B2AAC041;
 Wed,  5 Jul 2017 17:52:41 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 5980DAC040;
 Wed,  5 Jul 2017 17:52:41 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Add sysfs_notify on
 error
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
References: <1498853815-12959-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xf1xaN=sv5f-YGy0P5GYZxgLSbv3LNJnBUW6UZLp-PnHw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 5 Jul 2017 16:52:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf1xaN=sv5f-YGy0P5GYZxgLSbv3LNJnBUW6UZLp-PnHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070521-0044-0000-0000-000003659D98
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007326; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883367; UDB=6.00440677; IPR=6.00663559; 
 BA=6.00005454; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016098; XFM=3.00000015;
 UTC=2017-07-05 21:52:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070521-0045-0000-0000-000007939F0B
Message-Id: <64c37d52-2529-c300-b9b8-dbedec8cdf2f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-05_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707050360
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jul 2017 21:52:45 -0000



On 07/03/2017 01:04 AM, Joel Stanley wrote:
> On Sat, Jul 1, 2017 at 5:46 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> For userspace polling, we need to notify sysfs that the state of our
>> error entry has changed.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/occ/common.c | 40 ++++++++++++++++++++++++++++++----------
>>   drivers/hwmon/occ/common.h |  3 +++
>>   drivers/hwmon/occ/p8_i2c.c | 28 ++++++++++++++--------------
>>   drivers/hwmon/occ/p9_sbe.c | 34 ++++++++++++++++------------------
>>   4 files changed, 63 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index 4e3e411..f62cc6d 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -163,9 +163,22 @@ void occ_parse_poll_response(struct occ *occ)
>>          }
>>   }
>>
>> +void occ_set_error(struct occ *occ, int error)
>> +{
>> +       occ->error_count++;
>> +       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
>> +               occ->error = error;
> This means we only record the error number for the last error that
> occurred. Is that desirable?

Yep. Really the error storage could be bool, we just need to report 
"some occ failure" to userspace. The user can also see the real-time 
failure, if there is one, when reading the hwmon entries.

>
>> +}
>> +
>> +void occ_reset_error(struct occ *occ)
>> +{
>> +       occ->error_count = 0;
>> +       occ->error = 0;
>> +}
>> +
>>   int occ_poll(struct occ *occ)
>>   {
>> -       int rc;
>> +       int rc, error = occ->error;
>>          struct occ_poll_response_header *header;
>>          u16 checksum = occ->poll_cmd_data + 1;
>>          u8 cmd[8];
>> @@ -181,7 +194,7 @@ int occ_poll(struct occ *occ)
>>
>>          rc = occ->send_cmd(occ, cmd);
>>          if (rc)
>> -               return rc;
>> +               goto done;
>>
>>          header = (struct occ_poll_response_header *)occ->resp.data;
>>
>> @@ -198,18 +211,25 @@ int occ_poll(struct occ *occ)
>>          if (header->status & OCC_STAT_MASTER) {
>>                  if (hweight8(header->occs_present) !=
>>                      atomic_read(&occ_num_occs)) {
>> -                       occ->error = -EXDEV;
>>                          occ->bad_present_count++;
>> +
>> +                       if (occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
> Why do we have both bad_present_count and occ->occ_error?
>
> Could they be combined?

Not really, as I don't want to increment the real error count if there 
is the wrong number of OCCs. The real error count is a requirement from 
OCC team to retry twice and then reset OCC. That means in the driver, we 
need to count two errors and then notify userspace to reset.

I may drop bad_present_count altogether, as the only reason to have it 
was to prevent notifying userspace in the time between binding two OCC 
devices. But probably no one will listen during that time frame...

>
>> +                               occ->error = -EXDEV;
> What is EXDEV?
>
> #define   EXDEV           18      /* Cross-device link */
>
> I'm not sure what that is. Perhaps EIO? or EINVAL?

I wanted something unique so that a user can tell what's happening... If 
there is anything close to "bad device presence count" I'd happily use 
it. I'll try and find something better.

>
>>                  } else
>>                          occ->bad_present_count = 0;
>>          }
>> +done:
>> +       /* notify userspace if we change error state */
>> +       if (occ->error != error)
>> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
> So from now on userspace will be notified of every error. Is that intentional?

Yes, I think that's the requirement here, although it has been requested 
that I not notify if the error state goes back to 0, so I'll add that check.

Thanks for the review!
Eddie
>
>> +
>>          return rc;
>>   }
>>
>>   int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>>   {
>> -       int rc;
>> +       int rc, error = occ->error;
>>          u8 cmd[8];
>>          u16 checksum = 0x24;
>>          __be16 user_power_cap_be;
>> @@ -239,6 +259,10 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>>          rc = occ->send_cmd(occ, cmd);
>>          mutex_unlock(&occ->lock);
>>
>> +       /* notify userspace if we change error state */
>> +       if (occ->error != error)
>> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
>> +
>>          return rc;
>>   }
>>
>> @@ -260,14 +284,9 @@ int occ_update_response(struct occ *occ)
>>   static ssize_t occ_show_error(struct device *dev,
>>                                struct device_attribute *attr, char *buf)
>>   {
>> -       int error = 0;
>>          struct occ *occ = dev_get_drvdata(dev);
>>
>> -       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
>> -           occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
>> -               error = occ->error;
>> -
>> -       return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
>> +       return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
>>   }
>>
>>   static ssize_t occ_show_status(struct device *dev,
>> @@ -1152,6 +1171,7 @@ int occ_create_status_attrs(struct occ *occ)
>>                  (struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
>>                                                              occ_show_error,
>>                                                              NULL, 0);
>> +       occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
>>
>>          for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
>>                  rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
>> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
>> index a5f86c3..3b4bd91 100644
>> --- a/drivers/hwmon/occ/common.h
>> +++ b/drivers/hwmon/occ/common.h
>> @@ -116,6 +116,7 @@ struct occ {
>>          struct attribute_group group;
>>          const struct attribute_group *groups[2];
>>          struct sensor_device_attribute *status_attrs;
>> +       const char *error_attr_name;
>>
>>          u8 poll_cmd_data;
>>          int (*send_cmd)(struct occ *occ, u8 *cmd);
>> @@ -143,6 +144,8 @@ struct occ {
>>   extern atomic_t occ_num_occs;
>>
>>   void occ_parse_poll_response(struct occ *occ);
>> +void occ_reset_error(struct occ *occ);
>> +void occ_set_error(struct occ *occ, int error);
>>   int occ_poll(struct occ *occ);
>>   int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
>>   int occ_update_response(struct occ *occ);
>> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
>> index 29233b4..a7b1d4c 100644
>> --- a/drivers/hwmon/occ/p8_i2c.c
>> +++ b/drivers/hwmon/occ/p8_i2c.c
>> @@ -98,7 +98,7 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
>>
>>   static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>>   {
>> -       int i, rc;
>> +       int i, rc, error;
>>          unsigned long start;
>>          u16 data_length;
>>          struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
>> @@ -161,22 +161,18 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>>                  rc = -EFAULT;
>>          }
>>
>> -       occ->error = resp->return_status;
>> -
>>          if (rc < 0) {
>> -               occ->error_count++;
>> -               dev_warn(&client->dev, "occ bad response:%d\n",
>> -                        resp->return_status);
>> -               return rc;
>> +               error = resp->return_status;
>> +               dev_warn(&client->dev, "occ bad response:%d\n", error);
>> +               goto done;
>>          }
>>
>>          data_length = get_unaligned_be16(&resp->data_length_be);
>>          if (data_length > OCC_RESP_DATA_BYTES) {
>> -               occ->error_count++;
>> -               occ->error = -EDOM;
>> +               rc = -EDOM;
>>                  dev_warn(&client->dev, "occ bad data length:%d\n",
>>                           data_length);
>> -               return occ->error;
>> +               goto assign;
>>          }
>>
>>          for (i = 8; i < data_length + 7; i += 8) {
>> @@ -185,13 +181,17 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>>                          goto err;
>>          }
>>
>> -       occ->error_count = 0;
>> -       return data_length + 7;
>> +       occ_reset_error(occ);
>> +       return 0;
>>
>>   err:
>> -       occ->error_count++;
>> -       occ->error = rc;
>>          dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
>> +
>> +assign:
>> +       error = rc;
>> +
>> +done:
>> +       occ_set_error(occ, error);
>>          return rc;
>>   }
>>
>> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
>> index c85f133..db30a2d 100644
>> --- a/drivers/hwmon/occ/p9_sbe.c
>> +++ b/drivers/hwmon/occ/p9_sbe.c
>> @@ -25,7 +25,7 @@ struct p9_sbe_occ {
>>
>>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>   {
>> -       int rc;
>> +       int rc, error;
>>          unsigned long start;
>>          struct occ_client *client;
>>          struct occ_response *resp = &occ->resp;
>> @@ -35,9 +35,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>
>>   retry:
>>          client = occ_drv_open(p9_sbe_occ->sbe, 0);
>> -       if (!client)
>> -               /* don't increment occ error counter */
>> -               return -ENODEV;
>> +       if (!client) {
>> +               rc = -ENODEV;
>> +               goto assign;
>> +       }
>>
>>          rc = occ_drv_write(client, (const char *)&cmd[1], 7);
>>          if (rc < 0)
>> @@ -62,7 +63,8 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>                  }
>>                  break;
>>          case RESP_RETURN_SUCCESS:
>> -               rc = 0;
>> +               occ_reset_error(occ);
>> +               return 0;
>>                  break;
>>          case RESP_RETURN_CMD_INVAL:
>>          case RESP_RETURN_CMD_LEN:
>> @@ -77,23 +79,19 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>                  rc = -EFAULT;
>>          }
>>
>> -       occ->error = resp->return_status;
>> -
>> -       if (rc < 0) {
>> -               occ->error_count++;
>> -               dev_warn(occ->bus_dev, "occ bad response:%d\n",
>> -                        resp->return_status);
>> -               return rc;
>> -       }
>> -
>> -       occ->error_count = 0;
>> -       return 0;
>> +       error = resp->return_status;
>> +       dev_warn(occ->bus_dev, "occ bad response:%d\n", error);
>> +       goto done;
>>
>>   err:
>> -       occ->error_count++;
>> -       occ->error = rc;
>>          occ_drv_release(client);
>>          dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
>> +
>> +assign:
>> +       error = rc;
>> +
>> +done:
>> +       occ_set_error(occ, error);
>>          return rc;
>>   }
>>
>> --
>> 1.8.3.1
>>
