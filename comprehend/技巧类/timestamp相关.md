## 时间戳到时间

```python
def timestamp_to_datetime(timestamp_val):
    """
    :description:时间戳转成datetime类型
    :param timestamp_val float
    :return
    """
    timestamp_val = int(float(timestamp_val))
    # 注意一定要配置时区，不然会错
    return datetime.datetime.fromtimestamp(timestamp_val, tz='Asia/Shanghai')

```

或者

```python
ts2time = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(int(float(cur_ip_data['start_time']))))
```

